import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/auth/domain/entity/login_response_entity.dart';
import 'package:shoppingapp/feature/auth/domain/use_case/login_use_case.dart';

part 'login_state.dart';
part 'login_intent.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());
  final LoginUseCase _loginUseCase;
  Future<void> intent(Loginintent intent) async {
    switch (intent) {
      case LoginWithEmailPassword():
        await _login(intent.email, intent.password);
    }
  }

  Future<void> _login(String email, String password) async {
    emit(LoginLoading());
    final result = await _loginUseCase.invoke(email: email, password: password);
    switch (result) {
      case Success<LoginResponseEntity>():
        emit(LoginSuccess(result.data));
      case AppError<LoginResponseEntity>():
        emit(LoginError(result.messageError));
    }
  }
}
