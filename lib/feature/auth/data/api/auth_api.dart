import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/constants/api_constatnts.dart';
import 'package:shoppingapp/core/constants/app_keys.dart';
import 'package:shoppingapp/core/helper/app_secure_storage.dart';
import 'package:shoppingapp/core/network/api_error_handler.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/core/network/dio_factory.dart';
import 'package:shoppingapp/feature/auth/data/models/login_model_dto.dart';
import 'package:shoppingapp/feature/auth/data/models/register_model_dto.dart';

@lazySingleton
class AuthApi {
  final Dio _dio;
  final AppSecureStorage _secureStorage;

  AuthApi(
    DioFactory dioFactory,
    this._secureStorage,
  ) : _dio = dioFactory.dio;

  Future<ResultApi<String>> register(
    RegisterRequestDto request,
  ) async {
    try {
      final response = await _dio.post(
        ApiConstants.register,
        data: request.toJson(),
      );

      return Success(response.data['message'].toString());
    } on DioException catch (e) {
      return AppError(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError(e.toString());
    }
  }

  Future<ResultApi<LoginResponseDto>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      final loginResponse = LoginResponseDto.fromJson(
        response.data,
      );

      final token = loginResponse.token;

      if (token != null && token.isNotEmpty) {
        await _secureStorage.write(
          AppKeys.token,
          token,
        );
      }

      return Success(loginResponse);
    } on DioException catch (e) {
      return AppError(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError(e.toString());
    }
  }
}
