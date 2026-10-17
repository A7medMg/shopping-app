
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/product_details/data/models/product_details_dto.dart';

abstract interface class ProductDetailsApi {
  Future<ResultApi<ProductDetailsDto>> getProductDetails(int productId);
}
