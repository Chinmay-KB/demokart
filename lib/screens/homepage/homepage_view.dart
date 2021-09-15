import 'package:carousel_slider/carousel_slider.dart';
import 'package:demokart/utils/datamodels/product.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:demokart/widgets/horizontal_listview_item.dart';
import 'package:demokart/widgets/rounded_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'homepage_viewmodel.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomepageViewModel>.reactive(
      viewModelBuilder: () => HomepageViewModel(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        HomepageViewModel model,
        Widget? child,
      ) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            floatingActionButton: FloatingActionButton(
              onPressed: () => model.onAddProduct(),
            ),
            body: model.isBusy
                ? CircularProgressIndicator()
                : Stack(
                    children: [
                      RoundedAppBar(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                              itemCount: 3,
                              itemBuilder: (context, backIndex, currentIndex) =>
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        color: Theme.of(context).primaryColor,
                                        child:
                                            Text('Category number $backIndex'),
                                      ),
                                    ),
                                  ),
                              options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  aspectRatio: 3)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child:
                                Text('Bestsellers', style: TEXT_HEADING_STYLE),
                          ),
                          SizedBox(
                            height: 220,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: model.bestSellers.docs.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    HorizontalListViewItem(
                                      product:
                                          model.bestSellers.docs[index].data(),
                                    )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child:
                                Text('New Arrivals', style: TEXT_HEADING_STYLE),
                          ),
                          SizedBox(
                            height: 220,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: model.newArrivals.docs.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    HorizontalListViewItem(
                                      product:
                                          model.newArrivals.docs[index].data(),
                                    )),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
