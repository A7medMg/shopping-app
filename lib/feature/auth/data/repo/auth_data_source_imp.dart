import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/auth/data/api/auth_api.dart';
import 'package:shoppingapp/feature/auth/data/models/login_model_dto.dart';
import 'package:shoppingapp/feature/auth/data/models/register_model_dto.dart';
import 'package:shoppingapp/feature/auth/domain/entity/login_response_entity.dart';
import 'package:shoppingapp/feature/auth/domain/entity/register_request_entity.dart';
import 'package:shoppingapp/feature/auth/domain/repo/auth_data_source_interface.dart';
@Injectable(as: AuthDataSourceInterface)
class AuthDataSourceImp implements AuthDataSourceInterface {
  final AuthApi _authApi;
  AuthDataSourceImp(this._authApi);

  @override
  Future<ResultApi<String>> register(RegisterRequestEntity request) async {
    final requestDto = RegisterRequestDto(
      name: request.name,
      email: request.email,
      password: request.password,
      phone: request.phone,
      confirmPassword: request.confirmPassword,
    );
    final result = await _authApi.register(requestDto);
    return result;
  }

  @override
  Future<ResultApi<LoginResponseEntity>> login({
    required String email,
    required String password,
  }) async {
    final res = await _authApi.login(email, password);
    switch (res) {
      case Success<LoginResponseDto>():
        return Success(res.data.toEntity());
      case AppError<LoginResponseDto>():
        return AppError(res.messageError);
    }
  }
}
