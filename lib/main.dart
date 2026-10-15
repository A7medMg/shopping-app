import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppingapp/core/di/service_locator.dart';
import 'package:shoppingapp/core/routes/app_routes.dart';
import 'package:shoppingapp/core/routes/initial_routes.dart';
import 'package:shoppingapp/core/theme/app_theme.dart';
import 'package:shoppingapp/feature/app_section/presentation/view_model/app_section_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  String initRoute = await initialRoute();
  runApp(ShoppingApp(initRoute: initRoute));
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key, required this.initRoute});
  final String initRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.sizeOf(context),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => serviceLocator<AppSectionCubit>(),
        child: MaterialApp(
          initialRoute: initRoute,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
        ),
      ),
    );
  }
}