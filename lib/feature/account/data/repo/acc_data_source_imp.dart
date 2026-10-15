import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/user/user_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/account/data/api/account_api_interface.dart';
import 'package:shoppingapp/feature/account/domain/repo/acc_data_source_interface.dart';

@Injectable(as: AccDataSourceInterface)
class AccDataSourceImp implements AccDataSourceInterface {
  final Dio dio;
  final AccountApiInterface _api;
  AccDataSourceImp(this.dio, this._api);

  @override
  Future<ResultApi<UserEntity>> getUserData() async {
    final result = await _api.getUserData();
    switch (result) {
      case Success():
        final user = result.data.message;
        if (user == null) {
          return AppError('بيانات الحساب غير موجودة في استجابة الخادم');
        }
        return Success(user.toEntity());

      case AppError():
        return AppError(result.messageError);
    }
  }

  @override
  Future<ResultApi<void>> updateUserData({
    required String name,
    required String address,
    required String phone,
    required String image,
  }) async=>await _api.updateUserData(
        name: name, address: address, phone: phone, image: image);

  @override
  Future<ResultApi<String>> uploadImage(File image) async=>await _api.uploadImage(image);

  
}
