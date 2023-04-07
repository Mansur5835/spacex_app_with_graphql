import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spacex_grathql_app/features/presentation/pages/detail/detail_page.dart';
import 'package:spacex_grathql_app/features/presentation/pages/home/home_page.dart';

import '../components/app_navigator.dart';
import '../pages/splash/splash_page.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    args.set = settings.arguments;

    switch (settings.name) {
      case SplashPage.route:
        return PageTransition(
          child: const SplashPage(),
          alignment: Alignment.center,
          type: PageTransitionType.fade,
          settings: settings,
        );

      case HomePage.route:
        return PageTransition(
          child: HomePage(),
          alignment: Alignment.center,
          type: PageTransitionType.scale,
          settings: settings,
        );

      case DetailPage.route:
        return PageTransition(
          child: DetailPage(),
          alignment: Alignment.center,
          type: PageTransitionType.bottomToTop,
          settings: settings,
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
