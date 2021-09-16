import 'package:demokart/screens/checkout/checkout_viewmodel.dart';
import 'package:demokart/utils/themes/colors.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:flutter/material.dart';

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment(
      {Key? key,
      required this.selectedIndex,
      required this.onSelect,
      required this.paymentOptions})
      : super(key: key);
  final int selectedIndex;
  final Function(int) onSelect;
  final List<PaymentOptions> paymentOptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment mode',
                style: TEXT_HORIZONTAL_LIST_CARD_PRICE_STYLE,
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: paymentOptions.length,
                itemBuilder: (context, index) => ListTileTheme(
                  selectedColor: Colors.white,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    selectedTileColor: ACCENT_COLOR_LIGHT.withOpacity(0.6),
                    selected: selectedIndex == index,
                    title: Text(
                      paymentOptions[index].name,
                      style: TEXT_HORIZONTAL_LIST_CARD_PRICE_STYLE,
                    ),
                    subtitle: Text(
                      paymentOptions[index].data,
                      style: TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE.copyWith(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.grey),
                    ),
                    onTap: () => onSelect,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
