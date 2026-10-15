import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/constants/app_keys.dart';
import 'package:shoppingapp/core/helper/app_secure_storage.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/auth/domain/entity/login_response_entity.dart';
import 'package:shoppingapp/feature/auth/domain/entity/register_request_entity.dart';
import 'package:shoppingapp/feature/auth/domain/repo/auth_repo_interface.dart';
import 'package:shoppingapp/feature/auth/domain/repo/auth_data_source_interface.dart';

@Injectable(as: AuthRepoInterface)
class AuthRepoImp implements AuthRepoInterface {
  final AuthDataSourceInterface _dataSource;
  final AppSecureStorage _appSecureStorage;
  AuthRepoImp(this._dataSource, this._appSecureStorage);
  @override
  Future<ResultApi<String>> register(RegisterRequestEntity request) async =>
      await _dataSource.register(request);

  @override
  Future<ResultApi<LoginResponseEntity>> login({
    required String email,
    required String password,
  }) async {
    final result = await _dataSource.login(email: email, password: password);
    switch (result) {
      case Success<LoginResponseEntity>():
        var entity = result.data;
        await _appSecureStorage.write(AppKeys.token, entity.token);
        return Success(entity);
      case AppError<LoginResponseEntity>():
        return AppError(result.messageError);
    }
  }
}
