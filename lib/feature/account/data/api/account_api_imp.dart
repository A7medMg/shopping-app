import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' hide MultipartFile;
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/constants/api_constatnts.dart';
import 'package:shoppingapp/core/models/user/user_dto.dart';
import 'package:shoppingapp/core/network/api_error_handler.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/account/data/api/account_api_interface.dart';

@Injectable(as: AccountApiInterface)
class AccountApiImp implements AccountApiInterface {
  final Dio dio;
  AccountApiImp(this.dio);

  @override
  Future<ResultApi<UserDto>> getUserData() async {
    try {
      var response = await dio.get(ApiConstants.getUserData);
      var json = response.data;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Success(UserDto.fromJson(json));
      } else {
        return AppError('Failed to load user data');
      }
    } on DioException catch (e) {
      return AppError(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError("Something went wrong");
    }
  }

  @override
  Future<ResultApi<void>> updateUserData({
    required String name,
    required String address,
    required String phone,
    required String image,
  }) async{
    try {
      var response = await dio.post(ApiConstants.editUserData,data: {
        'name': name,
        'address': address,
        'phone': phone,
        'image': image,
      });
      var json = response.data;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Success(json);
      } else {
        return AppError('Failed to update user data');
      }
    } on DioException catch (e) {
      return AppError(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError("Something went wrong");
    }
    
  }

  @override
  Future<ResultApi<String>> uploadImage(File image) async{ try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType('image', 'png'),
        ),
      });

      final response = await dio.post(ApiConstants.uploadImage, data: formData);

      return Success(response.data.toString());
    } on DioException catch (e) {
      return AppError(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError('Something went wrong');
    }
  }
  }
