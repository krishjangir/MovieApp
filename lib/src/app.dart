import 'package:flutter/material.dart';
import 'package:movie_app/src/res/strings.dart';
import 'package:movie_app/src/router/custom_router.dart';
import 'package:movie_app/src/ui/HomeScreen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: CustomRouter.generateRoute,
        initialRoute: HomeScreen.id);
  }
}
