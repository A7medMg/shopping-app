part of 'account_cubit.dart';

abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountSuccess extends AccountState {
  final UserEntity userEntity;
  AccountSuccess(this.userEntity);
}

class AccountError extends AccountState {
  final String message;
  AccountError(this.message);
}
class AccountImageUploadSuccess extends AccountState {
  final String imageUrl;
  AccountImageUploadSuccess(this.imageUrl);
}
class AccountImageUploadError extends AccountState {
  final String message;
  AccountImageUploadError(this.message);
}
class AccountImageUploadLoading extends AccountState {}
class AccountEditUserDataSuccess extends AccountState {}
class AccountEditUserDataError extends AccountState {
  final String message;
  AccountEditUserDataError(this.message);
}
class AccountEditUserDataLoading extends AccountState {}  