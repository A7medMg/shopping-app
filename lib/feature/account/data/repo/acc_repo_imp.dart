import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/user/user_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/account/domain/repo/acc_data_source_interface.dart';
import 'package:shoppingapp/feature/account/domain/repo/acc_repo_interface.dart';

@Injectable(as: AccRepoInterface)
class AccRepoImp implements AccRepoInterface {
  final AccDataSourceInterface _dataSource;
  AccRepoImp(this._dataSource);
  @override
  Future<ResultApi<UserEntity>> getUserData() async {
    return await _dataSource.getUserData();
  }

  @override
  Future<ResultApi<void>> updateUserData({
    required String name,
    required String address,
    required String phone,
    required String image,
  })async=>await _dataSource.updateUserData(
        name: name, address: address, phone: phone, image: image);

  @override
  Future<ResultApi<String>> uploadImage(File image) async=> await _dataSource.uploadImage(image);

  /*
  @override
  Future<ResultApi<UserEntity>> updateUserData({
    required String name,
    required String email,
    required String phone,
    required String image,
  }) async {
    return await _dataSource.updateUserData(
      name: name,
      email: email,
      phone: phone,
      image: image,
    );
  }

  @override
  Future<ResultApi<String>> uploadImage(File image) async {
    return await _dataSource.uploadImage(image);
  }*/
}
