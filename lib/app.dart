import 'package:demokart/screens/checkout/checkout_view.dart';
import 'package:demokart/screens/homepage/homepage_view.dart';
import 'package:demokart/screens/login/login_view.dart';
import 'package:demokart/screens/product_detail/product_detail_view.dart';
import 'package:demokart/screens/splash_screen/splash_view.dart';
import 'package:demokart/utils/services/firestore_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomepageView, initial: true),
  MaterialRoute(page: SplashView),
  MaterialRoute(page: CheckoutView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: ProductDetailView)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: DialogService),
  Factory(classType: FirestoreService)
])
class AppSetup {}
