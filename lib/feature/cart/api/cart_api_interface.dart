import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/cart/data/model/add_to_cart_dto.dart';
import 'package:shoppingapp/feature/cart/data/model/delete_cart_dto.dart';

abstract interface class CartApiInterface {
  Future<ResultApi<List<ProductDto>>> getCart();

  Future<ResultApi<AddToCartDto>> addToCart(String productId);

  Future<ResultApi<DeleteCartDto>> deleteCart(String productId);
}
