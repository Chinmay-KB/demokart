import 'package:demokart/utils/themes/text_style.dart';
import 'package:demokart/widgets/cart_list_item_card.dart';
import 'package:demokart/widgets/loading_widget.dart';
import 'package:demokart/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewmodel.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        CartViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: const SimpleAppbar(title: 'Cart'),
          backgroundColor: Colors.grey.shade200,
          body: model.isBusy
              ? const LoadingWidget()
              : Stack(
                  children: [
                    if (model.isCartEmpty)
                      Center(
                        child: Text(
                          'No items available in cart',
                          style: TEXT_PRODUCT_DETAIL_TITLE,
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.cartItems.length,
                        itemBuilder: (context, index) => CartListItem(
                          product: model.cartItems[index],
                          onRemove: model.removeItem,
                        ),
                      ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            onTap: () {
                              if (!model.isCartEmpty) {
                                model.navigateToCheckout();
                              }
                            },
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: model.isCartEmpty
                                  ? Colors.grey
                                  : Theme.of(context).accentColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (model.isCartEmpty)
                                      const SizedBox()
                                    else
                                      RichText(
                                        text: TextSpan(
                                          text: 'Total cost ',
                                          style:
                                              TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE
                                                  .copyWith(
                                                      color: Colors.white),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '???${model.totalCost}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (!model.isCartEmpty) const Spacer(),
                                    Text(
                                      'Checkout',
                                      style:
                                          TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE
                                              .copyWith(
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
                    )
                  ],
                ),
        );
      },
    );
  }
}
