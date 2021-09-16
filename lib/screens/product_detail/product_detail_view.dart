import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:demokart/widgets/horizontal_listview_item.dart';
import 'package:demokart/widgets/loading_widget.dart';
import 'package:demokart/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'product_detail_viewmodel.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key, required this.productId})
      : super(key: key);
  final String productId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailViewModel>.reactive(
      viewModelBuilder: () => ProductDetailViewModel(),
      onModelReady: (model) => model.init(productId),
      builder: (
        BuildContext context,
        ProductDetailViewModel model,
        Widget? child,
      ) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: TextButton.icon(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    elevation: 4,
                    shape: const StadiumBorder(),
                    primary: Colors.white,
                    backgroundColor: Theme.of(context).accentColor),
                onPressed: () => model.addToCart(productId),
                icon: const Icon(Icons.add_shopping_cart_rounded),
                label: const Text('Add to cart')),
            backgroundColor: Colors.grey.shade200,
            appBar: const SimpleAppbar(title: 'Product details'),
            body: model.isBusy
                ? const LoadingWidget()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: CarouselSlider.builder(
                              itemCount: 3,
                              itemBuilder: (context, _, __) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CachedNetworkImage(
                                        imageUrl: model.product.imgUrl),
                                  ),
                              options: CarouselOptions(
                                  height: 300, enableInfiniteScroll: false)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model.product.name,
                                          style: TEXT_PRODUCT_DETAIL_TITLE,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Sold by ',
                                            style:
                                                TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE,
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      model.product.sellerName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 28,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                text: '4.8 ',
                                                style: GoogleFonts.notoSans(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: '(120)',
                                                      style:
                                                          GoogleFonts.notoSans(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: RichText(
                                      text: TextSpan(
                                        text:
                                            '₹${model.product.price.toInt()} ',
                                        style: GoogleFonts.notoSans(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  '₹${model.product.price.toInt() * 1.2}',
                                              style: GoogleFonts.notoSans(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //₹${product.price.toInt()}
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Description',
                                style: TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE,
                              ),
                              Text(
                                model.product.description,
                                style: TEXT_PRODUCT_DESC_BODY,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tags',
                                style: TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE,
                              ),
                              Wrap(
                                spacing: 8,
                                children: List<Chip>.generate(
                                  model.product.tags.length,
                                  (index) => Chip(
                                    label: Text(
                                      model.product.tags[index],
                                      style: GoogleFonts.notoSans(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Similar Items',
                                style: TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: model.similarProducts.docs.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  HorizontalListViewItem(
                                    product: model.similarProducts.docs[index]
                                        .data(),
                                    onTap: model.onTapProduct,
                                  )),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
