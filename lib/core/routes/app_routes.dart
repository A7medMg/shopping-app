import 'package:flutter/material.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/feature/onboarding/screens/on_boarding_screen.dart';
import 'package:shoppingapp/feature/app_section/presentation/view/app_section_screen.dart';

abstract class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const AppSection(),
        );
      case AppRoutesName.appSection:
        return MaterialPageRoute(
          builder: (_) => const AppSection(),
        );
      default:
        return null;
    }
  }
}