import 'package:demokart/app.locator.dart';
import 'package:demokart/app.router.dart';
import 'package:demokart/utils/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  onLogin() async {
    await _authService.signInwithGoogle();
    if (_authService.checkLoggedIn()) {
      _snackbarService.showSnackbar(message: 'Logged in');
      _navigationService.navigateTo(Routes.homepageView);
    } else
      _snackbarService.showSnackbar(message: 'Error');
  }

  onLogout() async {
    await _authService.signOutFromGoogle();
    if (!_authService.checkLoggedIn())
      _snackbarService.showCustomSnackBar(message: 'Logged out');
    else
      _snackbarService.showCustomSnackBar(message: 'Error');
  }
}
