import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/favorite/domain/entities/add_to_fav_entity.dart';
import 'package:shoppingapp/feature/favorite/domain/entities/remove_fav_entity.dart';
import 'package:shoppingapp/feature/favorite/domain/use_case/add_to_favorite_use_case.dart';
import 'package:shoppingapp/feature/favorite/domain/use_case/get_fav_use_case.dart';
import 'package:shoppingapp/feature/favorite/domain/use_case/remove_favorite_use_case.dart';
import 'package:shoppingapp/feature/favorite/presentation/view_model/fav_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoriteUseCase _getFavoriteUseCase;
  final AddToFavoriteUseCase _addToFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;


  FavoriteCubit(

    this._getFavoriteUseCase,  this._addToFavoriteUseCase,
    this._removeFavoriteUseCase
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
 Future<void> addToFavorite(String productId) async {
    emit(AddToFavoriteLoading());
    final result = await _addToFavoriteUseCase.invoke(productId);
    switch (result) {
      case Success<AddFavoriteEntity>():
        emit(AddToFavoriteSuccess());
      case AppError<AddFavoriteEntity>():
        emit(AddToFavoriteError(result.messageError));
    }
  }
  Future<void> removeFavorite(String productId) async {
    emit(RemoveFavoriteLoading());
    final result = await _removeFavoriteUseCase.invoke(productId);
    switch (result) {
      case Success<RemoveFavoriteEntity>():
        emit(RemoveFavoriteSuccess(result.data.message));
      case AppError<RemoveFavoriteEntity>():
        emit(RemoveFavoriteError(result.messageError));
    }
  }

} 