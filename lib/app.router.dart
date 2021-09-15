// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'screens/checkout/checkout_view.dart';
import 'screens/homepage/homepage_view.dart';
import 'screens/login/login_view.dart';
import 'screens/product_detail/product_detail_view.dart';
import 'screens/splash_screen/splash_view.dart';
import 'utils/datamodels/product.dart';

class Routes {
  static const String homepageView = '/homepage-view';
  static const String splashView = '/';
  static const String checkoutView = '/checkout-view';
  static const String loginView = '/login-view';
  static const String productDetailView = '/product-detail-view';
  static const all = <String>{
    homepageView,
    splashView,
    checkoutView,
    loginView,
    productDetailView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homepageView, page: HomepageView),
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.checkoutView, page: CheckoutView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.productDetailView, page: ProductDetailView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomepageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomepageView(),
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CheckoutView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    ProductDetailView: (data) {
      var args = data.getArgs<ProductDetailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductDetailView(
          key: args.key,
          product: args.product,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProductDetailView arguments holder class
class ProductDetailViewArguments {
  final Key? key;
  final Product product;
  ProductDetailViewArguments({this.key, required this.product});
}
