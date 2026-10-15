 import 'dart:io';

import 'package:shoppingapp/core/models/user/user_dto.dart';
import 'package:shoppingapp/core/network/api_result.dart';

abstract interface class AccountApiInterface {
  Future<ResultApi<UserDto>> getUserData();
  Future<ResultApi<void>> updateUserData({
    required String name,
    required String address,
    required String phone,
    required String image,
  });
  Future<ResultApi<String>> uploadImage(File image);
}