import 'package:shoppingapp/core/models/item/product_entity.dart';

abstract interface class FavoriteState {}
 class FavoriteInitial extends FavoriteState {}
 class FavoriteLoading extends FavoriteState {}
 class FavoriteSuccess extends FavoriteState {
  final List<ProductEntity> favoriteProducts;
  FavoriteSuccess(this.favoriteProducts);
}
class FavoriteError extends FavoriteState {
  final String errorMessage;
  FavoriteError(this.errorMessage);
}
class AddToFavoriteLoading extends FavoriteState {}
class AddToFavoriteSuccess extends FavoriteState{

}
class AddToFavoriteError extends FavoriteState {
  final String errorMessage;
  AddToFavoriteError(this.errorMessage);
}
class RemoveFavoriteLoading extends FavoriteState {}
class RemoveFavoriteSuccess extends FavoriteState {
  final String message;
  RemoveFavoriteSuccess(this.message);
}
class RemoveFavoriteError extends FavoriteState {
  final String errorMessage;
  RemoveFavoriteError(this.errorMessage);
}