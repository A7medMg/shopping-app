import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class DioFactory {
  late final Dio dio;

  DioFactory() : dio = _createDio();

  static Dio _createDio() {
    const apiBaseUrl =
        'https://supermarket-dan1.onrender.com/api/v1';

    const connectTimeout = Duration(seconds: 30);

    final dio = Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: connectTimeout,
      ),
    );

    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    return dio;
  }
}

const String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhYmZkYjczYjUyNzAxMTA5YTJiYjUzZSIsImlhdCI6MTc5MTAzOTIzNywiZXhwIjoxNzkzNjMxMjM3fQ.TSXiygT8c4LeEUi-K_-iC1G9CoHJxf8r1hWzojIStiI";