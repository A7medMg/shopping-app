import 'package:shoppingapp/core/constants/app_keys.dart';
import 'package:shoppingapp/core/di/service_locator.dart';
import 'package:shoppingapp/core/helper/app_secure_storage.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';

Future<String> initialRoute() async {
  final storage = serviceLocator<AppSecureStorage>();
  final token = await storage.read(AppKeys.token);
  if (token?.isNotEmpty == true) {
    return AppRoutesName.onBoarding;
  } else {
    return AppRoutesName.hello;
  }
}
