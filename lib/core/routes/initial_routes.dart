import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/core/constants/app_keys.dart';
import 'package:shoppingapp/core/di/service_locator.dart';
import 'package:shoppingapp/core/helper/app_secure_storage.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';

Future<String> initialRoute() async {
  final prefs = await SharedPreferences.getInstance();

  final isFirstTime = prefs.getBool('isFirstTime') ?? true;

  if (isFirstTime) {
    return AppRoutesName.onBoarding;
  }

  final storage = serviceLocator<AppSecureStorage>();
  final token = await storage.read(AppKeys.token);

  if (token != null && token.isNotEmpty) {
    return AppRoutesName.appSection;
  }

  return AppRoutesName.hello;
}
