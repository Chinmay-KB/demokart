import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget? child,
      ) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: TextButton(
                    onPressed: model.onLogin,
                    child: const Text('Log in'),
                  ),
                ),
                // Center(
                //   child: TextButton(
                //     onPressed: model.onLogout,
                //     child: Text('Log out'),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
