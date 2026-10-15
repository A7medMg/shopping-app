import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/di/service_locator.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/feature/app_section/presentation/view/app_section_screen.dart';
import 'package:shoppingapp/feature/auth/domain/use_case/login_use_case.dart';
import 'package:shoppingapp/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:shoppingapp/feature/hello/presentation/screens/hello_screen.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/home_cubit.dart';
import 'package:shoppingapp/feature/auth/presentation/view/screens/login_screen.dart';
import 'package:shoppingapp/feature/auth/presentation/view/screens/register_screen.dart';
import 'package:shoppingapp/feature/auth/data/api/auth_api.dart';
import 'package:shoppingapp/feature/auth/data/repo/auth_data_source_imp.dart';
import 'package:shoppingapp/feature/auth/data/repo/auth_repo_imp.dart';
import 'package:shoppingapp/feature/auth/domain/use_case/register_use_case.dart';
import 'package:shoppingapp/feature/auth/presentation/view_model/register/register_cubit.dart';

abstract class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<HomeCubit>()..getHomeData(),
            child: AppSection(),
          ),
        );
      case AppRoutesName.hello:
        return MaterialPageRoute(builder: (_) => const HelloScreen());
      case AppRoutesName.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case AppRoutesName.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
