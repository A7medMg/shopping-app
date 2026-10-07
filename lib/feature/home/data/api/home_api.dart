import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/data/models/category_model_dto.dart';

abstract interface class HomeApi {
  Future<ResultApi<CategoryDto>> getAllCategories();

  Future<ResultApi<ProductDto>> getAllProducts();
}
