import 'package:shoppingapp/core/models/item/product_entity.dart';

abstract interface class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<ProductEntity> cartProducts;
  CartSuccess(this.cartProducts);
}

class CartError extends CartState {
  final String errorMessage;
  CartError(this.errorMessage);
}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartError extends CartState {
  final String errorMessage;
  AddToCartError(this.errorMessage);
}

class RemoveCartLoading extends CartState {}

class RemoveCartSuccess extends CartState {
  final String message;
  RemoveCartSuccess(this.message);
}

class RemoveCartError extends CartState {
  final String errorMessage;
  RemoveCartError(this.errorMessage);
}
