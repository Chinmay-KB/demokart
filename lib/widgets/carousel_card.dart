import 'package:cached_network_image/cached_network_image.dart';
import 'package:demokart/utils/datamodels/carousel.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    required this.carouselItem,
    Key? key,
  }) : super(key: key);

  final Item carouselItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          color: Color(
            int.parse('0xff' + carouselItem.color),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (carouselItem.imageUrl != "")
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(imageUrl: carouselItem.imageUrl),
                  ),
                )
              else
                SizedBox(),
              Flexible(
                child: Text(
                  carouselItem.text,
                  maxLines: 2,
                  style: TEXT_HORIZONTAL_LIST_CARD_PRICE_STYLE.copyWith(
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
