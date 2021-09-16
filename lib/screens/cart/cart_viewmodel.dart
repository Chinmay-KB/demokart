import 'package:demokart/app.router.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/services/auth_service.dart';
import 'package:demokart/utils/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.locator.dart';

class CartViewModel extends BaseViewModel {
  final _firestoreService = locator<FirestoreService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  List<Product> cartItems = [];
  late int totalCost = 0;
  late bool isCartEmpty;
  late User? _user;
  Future<void> init() async {
    setBusy(true);
    cartItems.clear();
    totalCost = 0;
    _user = await _authService.getUser();
    final _cartItemsId =
        (await _firestoreService.getUserData(uid: _user!.uid)).data()!.cart;
    isCartEmpty = _cartItemsId.isEmpty;
    _cartItemsId.forEach((element) async {
      final _individualProduct =
          await _firestoreService.getSingleProduct(element);
      cartItems.add(_individualProduct.data()!);
      totalCost += _individualProduct.data()!.price.toInt();
      notifyListeners();
    });
    setBusy(false);
  }

  Future<void> removeItem(String productId) async {
    await _firestoreService.removeFromCart(
        uid: _user!.uid, productId: productId);
    init();
  }

  /// Passes list of all products for checkout to checkout page
  void navigateToCheckout() {
    _navigationService.navigateTo(
      Routes.checkoutView,
      arguments: CheckoutViewArguments(items: cartItems),
    );
  }
}
