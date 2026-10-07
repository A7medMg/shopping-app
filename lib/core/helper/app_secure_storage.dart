import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class AppSecureStorage {
  final FlutterSecureStorage _secureStorage ;
  AppSecureStorage(this._secureStorage);

  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    String? data = await _secureStorage.read(key: key);
    return data;
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }

}