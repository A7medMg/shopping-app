import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/favorite/domain/use_case/get_fav_use_case.dart';
import 'package:shoppingapp/feature/favorite/presentation/view_model/fav_state.dart';

@lazySingleton
class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoriteUseCase _getFavoriteUseCase;


  FavoriteCubit(
    this._getFavoriteUseCase,
  ) : super(FavoriteInitial());
 Future<void> getFavorite() async {
    emit(FavoriteLoading());
    final result = await _getFavoriteUseCase.invoke();
    switch (result) {
      case Success<List<ProductEntity>>():
        emit(FavoriteSuccess(result.data));
      case AppError<List<ProductEntity>>():
        emit(FavoriteError(result.messageError));
    }
 }

} 