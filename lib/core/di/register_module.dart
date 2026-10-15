import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shoppingapp/core/network/dio_factory.dart';

@module
abstract class RegisterModule {
  FlutterSecureStorage get secureStorage =>
      const FlutterSecureStorage();

  @lazySingleton
  Dio get dio => DioFactory().dio;
}