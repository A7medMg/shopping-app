import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';

abstract interface class SearchDataSourceInterface {
  Future<ResultApi<List<ProductEntity>>> searchProducts(String query);
}
