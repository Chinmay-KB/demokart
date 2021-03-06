import 'package:demokart/app.locator.dart';
import 'package:demokart/app.router.dart';
import 'package:demokart/utils/services/auth_service.dart';
import 'package:demokart/utils/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckoutViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final _snackbarService = locator<SnackbarService>();
  final _navigatorService = locator<NavigationService>();
  final _firestoreService = locator<FirestoreService>();
  final _authService = locator<AuthService>();

  final List<PaymentOptions> paymentOptions = [
    PaymentOptions(name: 'UPI', data: 'Zero transaction charges'),
    PaymentOptions(name: 'Net Banking', data: 'Rs 10 gateway charge'),
    PaymentOptions(name: 'Cash on Delivery', data: 'Rs 40 service charge')
  ];

  /// Stores the index of selected payment type, required to highlight the
  /// listtile
  int selectedPayment = 0;

  /// Sets payment preference [selectedPayment] when
  void setPayment(int index) {
    selectedPayment = index;
    notifyListeners();
  }

  /// Validates textformfield for the ones which are mandatory to fill.
  String? formValidation(String? value) {
    if (value == null || value.isEmpty) return 'Please enter data';
    return null;
  }

  String? optionalFormField(String? value) => null;

  /// When user has filled the required details, only when payment proceeds.
  /// This method checks for that, and if true, places order successfully, or in
  /// the case of this demo, clears the cart.
  Future<void> proceedToPayment() async {
    if (formKey.currentState!.validate()) {
      final _user = await _authService.getUser();
      _firestoreService.emptyCart(uid: _user!.uid);
      _navigatorService.pushNamedAndRemoveUntil(Routes.homepageView,
          predicate: (Route<dynamic> route) => false);
      _snackbarService.showSnackbar(message: 'Order placed successfully');
    }
  }
}

class PaymentOptions {
  PaymentOptions({required this.name, required this.data});

  final String name;
  final String data;
}
