import 'dart:io';

import 'package:shoppingapp/core/models/user/user_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';



abstract interface class AccRepoInterface {
  Future<ResultApi<UserEntity>> getUserData();
  Future<ResultApi<void>> updateUserData({
    required String name,
    required String address,
    required String phone,
    required String image,
  });
  Future<ResultApi<String>> uploadImage(File image);
}
