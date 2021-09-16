import 'package:demokart/screens/cart/cart_view.dart';
import 'package:demokart/screens/checkout/checkout_view.dart';
import 'package:demokart/screens/homepage/homepage_view.dart';
import 'package:demokart/screens/login/login_view.dart';
import 'package:demokart/screens/product_detail/product_detail_view.dart';
import 'package:demokart/screens/splash_screen/splash_view.dart';
import 'package:demokart/utils/services/auth_service.dart';
import 'package:demokart/utils/services/firestore_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(
    page: HomepageView,
  ),
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: CheckoutView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: ProductDetailView),
  MaterialRoute(page: CartView)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: DialogService),
  Factory(classType: FirestoreService),
  Factory(classType: AuthService)
])
class AppSetup {}
