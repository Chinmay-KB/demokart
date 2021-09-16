import 'package:carousel_slider/carousel_slider.dart';
import 'package:demokart/utils/datamodels/carousel.dart';
import 'package:demokart/widgets/carousel_card.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    required this.carouselData,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final Carousel carouselData;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: carouselData.items.length,
        itemBuilder: (context, actualIndex, viewIndex) => GestureDetector(
              onTap: () => onTap(carouselData.items[actualIndex].onClick),
              child: CarouselCard(
                carouselItem: carouselData.items[actualIndex],
              ),
            ),
        options: CarouselOptions(
            autoPlay: true, enlargeCenterPage: true, aspectRatio: 3));
  }
}
