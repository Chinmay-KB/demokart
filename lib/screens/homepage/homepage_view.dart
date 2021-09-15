import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'homepage_viewmodel.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomepageViewModel>.reactive(
      viewModelBuilder: () => HomepageViewModel(),
      builder: (
        BuildContext context,
        HomepageViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'HomepageView',
            ),
          ),
        );
      },
    );
  }
}
