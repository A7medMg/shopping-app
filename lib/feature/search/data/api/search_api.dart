import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/network/api_result.dart';

abstract interface class SearchApi {
  Future<ResultApi<ProductDto>> searchProducts(String query);
}
