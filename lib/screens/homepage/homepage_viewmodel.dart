import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demokart/app.locator.dart';
import 'package:demokart/app.router.dart';
import 'package:demokart/utils/datamodels/carousel.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/services/auth_service.dart';
import 'package:demokart/utils/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomepageViewModel extends BaseViewModel {
  final testData = Product(
      about: ['About this product'],
      category: 'Paintings',
      description:
          'Beautiful ACEO original handmade watercolor painting of high tides in ocean/ realistic waves of sea/ monochrome blue paintings. The size of this painting is 21*14 cm. The shipping charge is INR 200.',
      discount: 0,
      imgUrl:
          'https://presell.crowdpouch.com/wp-content/uploads/2021/09/DG_P1_copy.png',
      name: 'Watercolor',
      price: 1000,
      productId: 'aefS',
      listCategory: [],
      tags: [
        'Home made',
        'Canvas',
        'Watercolor',
        'Landscape',
        'Wall Decor',
        'Customized'
      ],
      sellerName: 'Homemade paintings');

  PaletteGenerator? paletteGenerator;

  late QuerySnapshot<Product> bestSellers;
  late QuerySnapshot<Product> newArrivals;
  late DocumentSnapshot<Carousel> carouselData;
  late QuerySnapshot<Product> allProducts;
  late User? user;

  final _firestoreService = locator<FirestoreService>();
  final _navigatorService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  // ignore: avoid_void_async
  void init() async {
    setBusy(true);
    bestSellers = await _firestoreService.getBestSellers();
    newArrivals = await _firestoreService.getNewArrivals();
    carouselData = await _firestoreService.getCarouselData();
    allProducts = await _firestoreService.getAllProducts();
    user = await _authService.getUser();
    notifyListeners();
    setBusy(false);
  }

  logout() async {
    await _authService.signOutFromGoogle();
    if (!_authService.checkLoggedIn()) {
      _navigatorService.navigateTo(Routes.splashView);
    }
  }

  /// Added only to populate data on the backend for demoing purposes
  Future<void> onAddProduct() async {
    await _firestoreService.addProduct(testData);
  }

  /// Handles user selecting any product on any list
  void onTapProduct(Product product) {
    _navigatorService.navigateTo(Routes.productDetailView,
        arguments: ProductDetailViewArguments(product: product));
  }

  void navigateToCart() => _navigatorService.navigateTo(Routes.cartView);
}
