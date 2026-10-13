import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  static const String _isFirstTimeKey = 'isFirstTime';

  static Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_isFirstTimeKey) ?? true;
  }

  static Future<void> completeOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_isFirstTimeKey, false);
  }
}
