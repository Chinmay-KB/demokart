import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demokart/app.locator.dart';
import 'package:demokart/utils/datamodels/category_wise_product.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:stacked/stacked.dart';

class HomepageViewModel extends BaseViewModel {
  final testData = Product(
      about: ['About this product'],
      category: 'Paintings',
      description: 'Description',
      discount: 0,
      imgUrl:
          'https://presell.crowdpouch.com/wp-content/uploads/2021/09/DG_P1_copy.png',
      name: 'Watercolor',
      price: 1000,
      productId: 'aefS',
      listCategory: [],
      sellerName: 'Chinmay');

  final prod_url1 =
      'https://presell.crowdpouch.com/wp-content/uploads/2021/07/PJ__P3.png';
  final prod_url2 =
      'https://presell.crowdpouch.com/wp-content/uploads/2021/09/DG_P1_copy.png';

  PaletteGenerator? paletteGenerator;

  late QuerySnapshot<Product> bestSellers;
  late QuerySnapshot<Product> newArrivals;

  final _firestoreService = locator<FirestoreService>();

  void init() async {
    setBusy(true);
    bestSellers = await _firestoreService.getBestSellers();
    newArrivals = await _firestoreService.getNewArrivals();
    notifyListeners();
    setBusy(false);
  }

  onAddProduct() async {
    await _firestoreService.addProduct(testData);
  }
}
