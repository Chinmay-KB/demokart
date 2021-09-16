import 'package:demokart/utils/themes/text_style.dart';
import 'package:demokart/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CheckoutAddress extends StatelessWidget {
  const CheckoutAddress(
      {Key? key,
      required this.formKey,
      required this.validator,
      required this.optionalValidator})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  final String? Function(String?) validator;
  final String? Function(String?) optionalValidator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                'Address',
                style: TEXT_HORIZONTAL_LIST_CARD_PRICE_STYLE,
              ),
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Address line 1',
                      validator: validator,
                    ),
                    CustomTextField(
                      hintText: 'Address line 2',
                      validator: optionalValidator,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'State',
                            validator: validator,
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'City',
                            validator: validator,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Pincode',
                            validator: validator,
                            inputType: TextInputType.number,
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Mobile no',
                            validator: validator,
                            inputType: TextInputType.number,
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
