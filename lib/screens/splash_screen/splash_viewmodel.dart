import 'package:demokart/app.locator.dart';
import 'package:demokart/app.router.dart';
import 'package:demokart/utils/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  late bool isLoggedIn;

  init() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    if (_authService.checkLoggedIn()) {
      _navigationService.navigateTo(Routes.homepageView);
    } else {
      _navigationService.navigateTo(Routes.loginView);
    }
    setBusy(false);
  }
}
