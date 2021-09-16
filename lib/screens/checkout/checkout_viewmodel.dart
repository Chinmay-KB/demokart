import 'package:demokart/app.locator.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckoutViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final _snackbarService = locator<SnackbarService>();
  final List<PaymentOptions> paymentOptions = [
    PaymentOptions(name: 'UPI', data: 'Zero transaction charges'),
    PaymentOptions(name: 'Net Banking', data: 'Rs 10 gateway charge'),
    PaymentOptions(name: 'Cash on Delivery', data: 'Rs 40 service charge')
  ];

  int selectedPayment = 0;

  void setPayment(int index) {
    selectedPayment = index;
    notifyListeners();
  }

  String? formValidation(String? value) {
    if (value == null || value.isEmpty) return 'Please enter data';
    return null;
  }

  String? optionalFormField(String? value) => null;

  proceedToPayment() {
    if (formKey.currentState!.validate()) {
      _snackbarService.showSnackbar(message: 'Order placed successfully');
    }
  }
}

class PaymentOptions {
  PaymentOptions({required this.name, required this.data});

  final String name;
  final String data;
}
