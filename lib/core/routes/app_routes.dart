import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/di/service_locator.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/feature/app_section/presentation/view/app_section_screen.dart';
import 'package:shoppingapp/feature/app_section/presentation/view_model/app_section_cubit.dart';
import 'package:shoppingapp/feature/auth/presentation/view/screens/login_screen.dart';
import 'package:shoppingapp/feature/auth/presentation/view/screens/register_screen.dart';
import 'package:shoppingapp/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:shoppingapp/feature/auth/presentation/view_model/register/register_cubit.dart';
import 'package:shoppingapp/feature/hello/presentation/screens/hello_screen.dart';

abstract class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    

      case AppRoutesName.appSection:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => serviceLocator<AppSectionCubit>(),
            child: const AppSection(),
          ),
        );

      case AppRoutesName.hello:
        return MaterialPageRoute(builder: (_) => const HelloScreen());

      case AppRoutesName.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => serviceLocator<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case AppRoutesName.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => serviceLocator<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
