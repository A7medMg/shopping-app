import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/cart/domain/entities/add_to_cart_entity.dart';
import 'package:shoppingapp/feature/cart/domain/entities/delete_cart_entity.dart';

abstract interface class CartDataSourceInterface {
  Future<ResultApi<List<ProductEntity>>> getCart();

  Future<ResultApi<AddToCartEntity>> addToCart(String productId);

  Future<ResultApi<DeleteCartEntity>> deleteCart(String productId);
}
//
