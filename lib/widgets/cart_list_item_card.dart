import 'package:cached_network_image/cached_network_image.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({Key? key, required this.product, required this.onRemove})
      : super(key: key);
  final Product product;
  final Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      fit: BoxFit.fitHeight,
                      height: 130,
                      width: 130,
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
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        product.name + product.name,
                        style: TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE.copyWith(
                            fontWeight: FontWeight.w600),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '₹${product.price.toInt()} ',
                          style: GoogleFonts.notoSans(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: '₹${product.price.toInt() * 1.2}',
                              style: GoogleFonts.notoSans(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Sold by ',
                          style: TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE.copyWith(
                              fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                                text: product.sellerName,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
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
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '(120)',
                                    style: GoogleFonts.notoSans(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          primary: Colors.red,
                          // shape: RoundedRectangleBorder(
                          //     side: BorderSide(
                          //         color: ACCENT_COLOR_LIGHT),
                          //     borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () => onRemove(product.productId),
                        icon: Icon(Icons.delete_rounded),
                        label: Text('Remove'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
