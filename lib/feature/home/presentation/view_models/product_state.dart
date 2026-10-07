import 'package:shoppingapp/core/models/item/product_entity.dart';

abstract interface class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductEntity> product;
  ProductSuccess(this.product);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}
