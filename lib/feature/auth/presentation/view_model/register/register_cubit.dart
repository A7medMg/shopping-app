import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/auth/domain/entity/register_request_entity.dart';
import 'package:shoppingapp/feature/auth/domain/use_case/register_use_case.dart';

part 'register_state.dart';
part 'register_intent.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(RegisterInitial());
  final RegisterUseCase _registerUseCase;
Future<void> intent(RegisterIntent intent) async {
  if (intent is Register) {
    await _register(intent.registerRequest);
  }
}
  Future<void> _register(RegisterRequestEntity request) async {
    emit(RegisterLoading());
    final result = await _registerUseCase.invoke(request);
    switch (result) {
      case Success<String>():
        emit(RegisterSuccess(result.data));
      case AppError():
        emit(RegisterError(result.messageError));
    }
  }
}
