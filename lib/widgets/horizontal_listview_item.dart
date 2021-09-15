import 'package:cached_network_image/cached_network_image.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

/// Widget used for showing individual items in horizontal list on the home
/// screen. Currently used for new arrivals and bestsellers
class HorizontalListViewItem extends StatelessWidget {
  const HorizontalListViewItem({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        height: 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: product.imgUrl,
                      placeholder: (context, val) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 140,
                          width: 140,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    product.name,
                    style: TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('₹${product.price.toInt()}',
                      style: TEXT_HORIZONTAL_LIST_CARD_PRICE_STYLE),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}