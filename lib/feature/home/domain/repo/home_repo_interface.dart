import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/domain/entities/category_entity.dart';

abstract interface class HomeRepoInterface {
  Future<ResultApi<List<CategoryEntity>>> getAllCategory();
  Future<ResultApi<List<ProductEntity>>> getAllProduct();
   Future<ResultApi<List<ProductEntity>>> getAllProductByCategory(String categoryId);

}
