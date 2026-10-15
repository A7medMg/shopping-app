import 'package:flutter/material.dart';

import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/feature/onboarding/screens/on_boarding_screen.dart';
import 'package:shoppingapp/feature/auth/screens/login_screen.dart';

abstract class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case AppRoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return null;
    }
  }
}
