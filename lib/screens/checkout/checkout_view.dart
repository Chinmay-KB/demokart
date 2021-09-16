import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:demokart/widgets/checkout_address_widget.dart';
import 'package:demokart/widgets/checkout_payment.dart';
import 'package:demokart/widgets/checkout_summary.dart';
import 'package:demokart/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'checkout_viewmodel.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key, required this.items}) : super(key: key);
  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckoutViewModel>.reactive(
      viewModelBuilder: () => CheckoutViewModel(),
      builder: (
        BuildContext context,
        CheckoutViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey.shade200,
          appBar: const SimpleAppbar(title: 'Checkout'),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CheckoutSummary(items: items),
                    CheckoutAddress(
                      formKey: model.formKey,
                      validator: model.formValidation,
                      optionalValidator: model.optionalFormField,
                    ),
                    CheckoutPayment(
                      onSelect: model.setPayment,
                      paymentOptions: model.paymentOptions,
                      selectedIndex: model.selectedPayment,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: model.proceedToPayment,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Proceed to payment',
                              style:
                                  TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
