import 'package:flutter/material.dart';

import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/feature/app_section/presentation/view/app_section_screen.dart';
import 'package:shoppingapp/feature/hello/presentation/screens/hello_screen.dart';


abstract class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.hello:
        return MaterialPageRoute(builder: (_) => const HelloScreen());
      case AppRoutesName.appSection:
        return MaterialPageRoute(builder: (_) => const AppSection());
      default:
        return null;
    }
  }
}
