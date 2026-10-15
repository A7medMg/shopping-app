part of 'register_cubit.dart';

sealed class RegisterIntent {}

class Register extends RegisterIntent {
  final RegisterRequestEntity registerRequest;
  Register(this.registerRequest);
}
