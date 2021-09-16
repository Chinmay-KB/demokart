import 'package:demokart/app.locator.dart';
import 'package:demokart/app.router.dart';
import 'package:demokart/utils/datamodels/user.dart';
import 'package:demokart/utils/services/auth_service.dart';
import 'package:demokart/utils/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _firebaseService = locator<FirestoreService>();
  final _snackbarService = locator<SnackbarService>();

  late bool isLoggedIn;

  init() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn = _authService.checkLoggedIn();
    if (isLoggedIn) {
      _navigationService.pushNamedAndRemoveUntil(Routes.homepageView,
          predicate: (route) => false);
    } else {
      // _navigationService.navigateTo(Routes.loginView);
    }
    setBusy(false);
  }

  Future<void> onLogin() async {
    await _authService.signInwithGoogle();
    if (_authService.checkLoggedIn()) {
      final _userData = await _authService.getUser();
      final _userExists =
          await _firebaseService.checkUserExists(_userData!.uid);
      if (!_userExists) {
        await _firebaseService.createNewUser(
            uid: _userData.uid,
            userData: UserData(
                email: _userData.email!,
                name: _userData.displayName!,
                cart: []));
      }
      _navigationService.pushNamedAndRemoveUntil(Routes.homepageView,
          predicate: (route) => false);
    } else {
      _snackbarService.showSnackbar(message: 'Error');
    }
  }

  onLogout() async {
    await _authService.signOutFromGoogle();
    if (!_authService.checkLoggedIn()) {
      _snackbarService.showCustomSnackBar(message: 'Logged out');
    } else {
      _snackbarService.showCustomSnackBar(message: 'Error');
    }
  }
}
