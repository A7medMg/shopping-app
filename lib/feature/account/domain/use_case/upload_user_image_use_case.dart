import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/account/domain/repo/acc_repo_interface.dart';

@injectable
class UploadImageUseCase {
  final AccRepoInterface _repo;
  UploadImageUseCase(this._repo);
  Future<ResultApi<String>> invoke(File image) async {
    return await _repo.uploadImage(image);
  }
}
