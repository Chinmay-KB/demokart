import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demokart/app.locator.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/services/auth_service.dart';
import 'package:demokart/utils/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.router.dart';

class ProductDetailViewModel extends BaseViewModel {
  final _firestoreService = locator<FirestoreService>();
  final _navigatorService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();

  late QuerySnapshot<Product> similarProducts;
  late User? _user;
  void init(Product product) async {
    setBusy(true);
    product.tags.shuffle();
    _user = await _authService.getUser();
    similarProducts = await _firestoreService.getSimilarProducts(product.tags);
    setBusy(false);
  }

  /// Handles user selecting any product on any list
  void onTapProduct(Product product) {
    _navigatorService.navigateTo(Routes.productDetailView,
        arguments: ProductDetailViewArguments(product: product));
  }

  Future<void> addToCart(Product product) async {
    await _firestoreService.addToCart(
        uid: _user!.uid, productId: product.productId);
    _snackbarService.showSnackbar(message: 'Added to cart');
  }
}
