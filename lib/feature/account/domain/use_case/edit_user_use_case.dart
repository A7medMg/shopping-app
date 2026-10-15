
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/account/domain/repo/acc_repo_interface.dart';

@injectable
class EditUserUseCase {
  final AccRepoInterface _repo;
  EditUserUseCase(this._repo);
  Future<ResultApi<void>> invoke({
    required String name,
    required String address,
    required String phone,
    required String image,
  }) async {
    return await _repo.updateUserData(
      name: name,
      address: address,
      phone: phone,
      image: image,
    );
  }
}
