import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/user/user_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/account/domain/repo/acc_repo_interface.dart';


@injectable
class GetUserUseCase {
  final AccRepoInterface _repo;
  GetUserUseCase(this._repo);
  Future<ResultApi<UserEntity>> invoke() async {
    return await _repo.getUserData();
  }
}
