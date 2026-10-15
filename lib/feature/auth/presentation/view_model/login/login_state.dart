part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseEntity loginResponseEntity;
  LoginSuccess(this.loginResponseEntity);
}

class LoginError extends LoginState {
  final String errorMessage;
  LoginError(this.errorMessage);
}
