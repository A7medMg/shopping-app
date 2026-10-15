import 'package:shoppingapp/core/constants/app_keys.dart';

class LoginResponseEntity {
  String message;
  String token;

  LoginResponseEntity({this.message = "Message", this.token=AppKeys.token,});

}
