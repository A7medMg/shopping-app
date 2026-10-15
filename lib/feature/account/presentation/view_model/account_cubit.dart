import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/user/user_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/account/domain/use_case/edit_user_use_case.dart';
import 'package:shoppingapp/feature/account/domain/use_case/get_user_use_case.dart';
import 'package:shoppingapp/feature/account/domain/use_case/upload_user_image_use_case.dart';

part 'account_state.dart';

@injectable
class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this._getUserUseCase, this._uploadImageUseCase, this._editUserUseCase)
    : super(AccountInitial());
  final GetUserUseCase _getUserUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final EditUserUseCase _editUserUseCase;
  File? imagepath;

  Future<void> getUserData() async {
    emit(AccountLoading());
    final result = await _getUserUseCase.invoke();
    switch (result) {
      case Success():
        emit(AccountSuccess(result.data));
      case AppError():
        emit(AccountError(result.messageError));
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagepath = File(image.path);
    }
  }

  Future<void> uploadImage() async {
    emit(AccountImageUploadLoading());
    final result = await _uploadImageUseCase.invoke(imagepath!);
    switch (result) {
      case Success():
        emit(AccountImageUploadSuccess(result.data));
      case AppError():
        emit(AccountImageUploadError(result.messageError));
    }
  }
  Future<void> updateUserData({
    required String name,
    required String address,
    required String phone,
    required String image,
  }) async {
    emit(AccountEditUserDataLoading());
    final result = await _editUserUseCase.invoke(
      name: name,
      address: address,
      phone: phone,
      image: image,
    );
    switch (result) {
      case Success():
        emit(AccountEditUserDataSuccess());
      case AppError():
        emit(AccountEditUserDataError(result.messageError));
    }
  }
  
}
