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