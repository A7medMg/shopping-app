import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/product_details/domain/entities/product_details_entity.dart';

abstract interface class ProductDetailsRepoInterface {
  Future<ResultApi<ProductDetailsEntity>> getProductDetails(int productId);
}
