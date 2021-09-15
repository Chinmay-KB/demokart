import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demokart/app.locator.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.router.dart';

class ProductDetailViewModel extends BaseViewModel {
  final _firestoreService = locator<FirestoreService>();
  final _navigatorService = locator<NavigationService>();

  late QuerySnapshot<Product> similarProducts;
  void init(Product product) async {
    setBusy(true);
    product.tags.shuffle();
    similarProducts = await _firestoreService.getSimilarProducts(product.tags);
    log(similarProducts.docs.length.toString());
    setBusy(false);
  }

  /// Handles user selecting any product on any list
  void onTapProduct(Product product) {
    _navigatorService.navigateTo(Routes.productDetailView,
        arguments: ProductDetailViewArguments(product: product));
  }
}
