import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/auth/domain/entity/register_request_entity.dart';
import 'package:shoppingapp/feature/auth/domain/repo/auth_repo_interface.dart';
@injectable
class RegisterUseCase {
  final AuthRepoInterface _authRepo;
  RegisterUseCase(this._authRepo);
  Future<ResultApi<String>> invoke(RegisterRequestEntity request) async =>
      await _authRepo.register(request);
}
