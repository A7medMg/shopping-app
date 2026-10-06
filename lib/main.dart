import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppingapp/core/di/service_locator.dart';
import 'package:shoppingapp/core/routes/app_routes.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/core/theme/app_theme.dart';

void main() {
  configureDependencies();
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.sizeOf(context),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        initialRoute: AppRoutesName.onBoarding,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
      ),
    );
  }
}
