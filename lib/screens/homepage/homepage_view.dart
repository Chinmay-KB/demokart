import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demokart/utils/themes/colors.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:demokart/widgets/carousel_card.dart';
import 'package:demokart/widgets/carousel_widget.dart';
import 'package:demokart/widgets/horizontal_listview_item.dart';
import 'package:demokart/widgets/loading_widget.dart';
import 'package:demokart/widgets/rounded_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'homepage_viewmodel.dart';

class HomepageView extends StatelessWidget {
  HomepageView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

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
            key: _key,
            drawer: model.isBusy
                ? const SizedBox()
                : Drawer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(model.user!.photoURL!),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Hello,\n',
                                style: TEXT_HORIZONTAL_LIST_CARD_NAME_STYLE
                                    .copyWith(fontSize: 24),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: model.user!.displayName!
                                          .split(' ')[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TextButton.icon(
                            onPressed: model.logout,
                            icon: Icon(
                              Icons.logout_rounded,
                              color: Colors.amber,
                            ),
                            label: Text('Logout'))
                      ],
                    ),
                  ),
            appBar: AppBar(
              backgroundColor: ACCENT_COLOR_LIGHT,
              automaticallyImplyLeading: false,
              title: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _key.currentState!.openDrawer(),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    Text(
                      'Demokart',
                      style: TEXT_HEADING_STYLE.copyWith(
                          color: Colors.white, fontSize: 24),
                    ),
                    GestureDetector(
                      onTap: model.navigateToCart,
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.grey.shade200,
            body: model.isBusy
                ? LoadingWidget()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CarouselWidget(
                          carouselData: model.carouselData.data()!,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text('Bestsellers', style: TEXT_HEADING_STYLE),
                        ),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: model.bestSellers.docs.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  HorizontalListViewItem(
                                    onTap: model.onTapProduct,
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
                            itemBuilder: (BuildContext context, int index) =>
                                HorizontalListViewItem(
                              product: model.newArrivals.docs[index].data(),
                              onTap: model.onTapProduct,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child:
                              Text('All products', style: TEXT_HEADING_STYLE),
                        ),
                        GridView.builder(
                          itemCount: model.allProducts.docs.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              HorizontalListViewItem(
                                  product: model.allProducts.docs[index].data(),
                                  onTap: model.onTapProduct),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      MediaQuery.of(context).size.width / 2,
                                  childAspectRatio: 150 / 160,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0),
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
