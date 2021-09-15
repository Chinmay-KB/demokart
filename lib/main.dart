import 'package:demokart/utils/themes/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import 'app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: PRIMARY_COLOR,
          primaryColorLight: PRIMARY_COLOR_LIGHT,
          accentColor: ACCENT_COLOR_LIGHT),
    );
  }
}
