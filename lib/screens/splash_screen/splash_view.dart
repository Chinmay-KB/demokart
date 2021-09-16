import 'package:demokart/utils/themes/colors.dart';
import 'package:demokart/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        SplashViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: ACCENT_COLOR_LIGHT,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DemoKart',
                  style: TEXT_HEADING_STYLE.copyWith(
                      fontSize: 36, color: Colors.white),
                ),
                if (!model.isBusy)
                  GestureDetector(
                    onTap: model.onLogin,
                    child: AnimatedOpacity(
                      duration: Duration(seconds: 2),
                      opacity: model.isLoggedIn ? 0 : 1,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(
                            'Log in with Google',
                            style: TEXT_HEADING_STYLE.copyWith(
                                color: ACCENT_COLOR_DARK),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
