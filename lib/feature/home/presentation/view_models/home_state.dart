import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/feature/home/domain/entities/category_entity.dart';

abstract interface class HomeState {}

class ProductInitial extends HomeState {}

class ProductLoading extends HomeState {}

class ProductSuccess extends HomeState {
  final List<ProductEntity> product;
  ProductSuccess(this.product);
}

class ProductError extends HomeState {
  final String message;

  ProductError(this.message);
}
class CategoryLoading extends HomeState {}
class CategorySuccess extends HomeState {
  final List<CategoryEntity> category;
  CategorySuccess(this.category);
}
class CategoryError extends HomeState {
  final String message;

  CategoryError(this.message);
}

