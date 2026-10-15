import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/auth/domain/entity/login_response_entity.dart';
import 'package:shoppingapp/feature/auth/domain/entity/register_request_entity.dart';

abstract  interface class AuthDataSourceInterface {
  Future<ResultApi<String>> register(RegisterRequestEntity request);
  Future<ResultApi<LoginResponseEntity>> login({required String email , required String password});
}