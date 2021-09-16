import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Product> items;

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
                'Summary',
                style: TEXT_HORIZONTAL_LIST_CARD_PRICE_STYLE,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[index].name,
                      style: GoogleFonts.notoSans(fontSize: 16),
                    ),
                    Text(
                      '₹${items[index].price.toInt()}',
                      style: GoogleFonts.notoSans(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Divider(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.notoSans(fontSize: 16),
                  ),
                  Text(
                    '₹${getTotalSum(items)}',
                    style: GoogleFonts.notoSans(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  int getTotalSum(List<Product> products) {
    int totalSum = 0;
    products.forEach((element) {
      totalSum += element.price.toInt();
    });
    return totalSum;
  }
}
