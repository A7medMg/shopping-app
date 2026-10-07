import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String getMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badResponse:
        final data = e.response?.data;

        if (data is Map<String, dynamic>) {
          return data["message"] ?? "Server Error";
        }

        if (data is String) {
          return data;
        }

        return "Server Error";
      case DioExceptionType.connectionError:
        return 'No Internet Connection';
      default:
        return 'Something went Wrong';
    }
  }
}
