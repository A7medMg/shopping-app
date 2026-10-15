part of 'login_cubit.dart';

sealed class Loginintent {}

class LoginWithEmailPassword extends Loginintent {
  final String email;
  final String password;
  LoginWithEmailPassword(this.email, this.password);
}
