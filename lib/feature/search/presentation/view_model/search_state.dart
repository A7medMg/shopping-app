import 'package:shoppingapp/core/models/item/product_entity.dart';

sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ProductEntity> products;

  SearchSuccess(this.products);
}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String messageError;

  SearchError(this.messageError);
}
