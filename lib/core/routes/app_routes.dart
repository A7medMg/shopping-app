import 'package:flutter/material.dart';

import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/feature/onboarding/screens/on_boarding_screen.dart';
import 'package:shoppingapp/feature/hello/presentation/screens/hello_screen.dart';
import 'package:shoppingapp/feature/login/presentation/screens/login_screen.dart';
import 'package:shoppingapp/feature/register/presentation/screens/register_screen.dart';

abstract class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case AppRoutesName.hello:
        return MaterialPageRoute(builder: (_) => const HelloScreen());

      case AppRoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutesName.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      default:
        return null;
    }
  }
}
