// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'screens/cart/cart_view.dart';
import 'screens/checkout/checkout_view.dart';
import 'screens/homepage/homepage_view.dart';
import 'screens/product_detail/product_detail_view.dart';
import 'screens/splash_screen/splash_view.dart';
import 'utils/datamodels/product.dart';

class Routes {
  static const String homepageView = '/homepage-view';
  static const String splashView = '/';
  static const String checkoutView = '/checkout-view';
  static const String productDetailView = '/product-detail-view';
  static const String cartView = '/cart-view';
  static const all = <String>{
    homepageView,
    splashView,
    checkoutView,
    productDetailView,
    cartView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homepageView, page: HomepageView),
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.checkoutView, page: CheckoutView),
    RouteDef(Routes.productDetailView, page: ProductDetailView),
    RouteDef(Routes.cartView, page: CartView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomepageView: (data) {
      var args = data.getArgs<HomepageViewArguments>(
        orElse: () => HomepageViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomepageView(key: args.key),
        settings: data,
      );
    },
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    CheckoutView: (data) {
      var args = data.getArgs<CheckoutViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CheckoutView(
          key: args.key,
          items: args.items,
        ),
        settings: data,
      );
    },
    ProductDetailView: (data) {
      var args = data.getArgs<ProductDetailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductDetailView(
          key: args.key,
          productId: args.productId,
        ),
        settings: data,
      );
    },
    CartView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CartView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomepageView arguments holder class
class HomepageViewArguments {
  final Key? key;
  HomepageViewArguments({this.key});
}

/// CheckoutView arguments holder class
class CheckoutViewArguments {
  final Key? key;
  final List<Product> items;
  CheckoutViewArguments({this.key, required this.items});
}

/// ProductDetailView arguments holder class
class ProductDetailViewArguments {
  final Key? key;
  final String productId;
  ProductDetailViewArguments({this.key, required this.productId});
}
