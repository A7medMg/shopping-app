import 'package:injectable/injectable.dart';
import 'package:shoppingapp/feature/auth/domain/repo/auth_repo_interface.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/auth/domain/entity/login_response_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepoInterface _authRepo;
  LoginUseCase(this._authRepo);
  Future<ResultApi<LoginResponseEntity>> invoke({
    required String email,
    required String password,
  }) async => await _authRepo.login(email: email, password: password);
}
