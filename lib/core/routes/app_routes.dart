import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/di/service_locator.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/feature/app_section/presentation/view/app_section_screen.dart';
import 'package:shoppingapp/feature/hello/presentation/screens/hello_screen.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/home_cubit.dart';

abstract class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => serviceLocator<HomeCubit>()..getHomeData(),
            child: AppSection(),
          ),
        );
        case AppRoutesName.hello:
        return MaterialPageRoute(
          builder: (_) => const HelloScreen(),
        );
      default:
        return null;
    }
  }
}
