import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @singleton
  Dio provideDio() {
    const connectTimeout = Duration(seconds: 30);

    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://supermarket-dan1.onrender.com/api/v1',
        connectTimeout: connectTimeout,
        receiveTimeout: connectTimeout,
      ),
    );

    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhYmZkYjczYjUyNzAxMTA5YTJiYjUzZSIsImlhdCI6MTc5MTAzOTIzNywiZXhwIjoxNzkzNjMxMjM3fQ.TSXiygT8c4LeEUi-K_-iC1G9CoHJxf8r1hWzojIStiI',
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
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';


// @singleton
// class DioFactory {
//   late final Dio dio;

//   DioFactory(String apiBaseUrl) : dio = _createDio(apiBaseUrl);

//   static Dio _createDio(String apiBaseUrl) {
//     const connectTimeout = Duration(seconds: 30);
//     final dio = Dio(
//       BaseOptions(
//         baseUrl: apiBaseUrl,
//         connectTimeout: connectTimeout,
//         receiveTimeout: connectTimeout,
//       ),
//     );
//     dio.options.headers = {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
//     dio.interceptors.add(
//       PrettyDioLogger(
//         requestBody: true,
//         requestHeader: true,
//         responseHeader: true,
//       ),
//     );
//     return dio;
//   }
// }
// String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhYmZkYjczYjUyNzAxMTA5YTJiYjUzZSIsImlhdCI6MTc5MTAzOTIzNywiZXhwIjoxNzkzNjMxMjM3fQ.TSXiygT8c4LeEUi-K_-iC1G9CoHJxf8r1hWzojIStiI";
