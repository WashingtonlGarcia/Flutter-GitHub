import 'package:flutter/material.dart';
import '../views/home_page.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomePage.routeName:
      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
        break;
    }
  }
}
