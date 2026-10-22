import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/cart/api/cart_api_interface.dart';
import 'package:shoppingapp/feature/cart/data/model/add_to_cart_dto.dart';
import 'package:shoppingapp/feature/cart/data/model/delete_cart_dto.dart';
import 'package:shoppingapp/feature/cart/domain/entities/add_to_cart_entity.dart';
import 'package:shoppingapp/feature/cart/domain/entities/delete_cart_entity.dart';
import 'package:shoppingapp/feature/cart/domain/repo/cart_data_source_interface.dart';

@Injectable(as: CartDataSourceInterface)
class CartDataSourceImp implements CartDataSourceInterface {
  final CartApiInterface _cartApi;

  CartDataSourceImp(this._cartApi);

  @override
  Future<ResultApi<List<ProductEntity>>> getCart() async {
    final result = await _cartApi.getCart();

    switch (result) {
      case Success<List<ProductDto>>():
        final products = result.data.expand((dto) => dto.toEntity()).toList();

        return Success<List<ProductEntity>>(products);

      case AppError<List<ProductDto>>():
        return AppError<List<ProductEntity>>(result.messageError);
    }
  }

  @override
  Future<ResultApi<AddToCartEntity>> addToCart(String productId) async {
    final result = await _cartApi.addToCart(productId);

    switch (result) {
      case Success<AddToCartDto>():
        return Success<AddToCartEntity>(result.data.toEntity());

      case AppError<AddToCartDto>():
        return AppError<AddToCartEntity>(result.messageError);
    }
  }

  @override
  Future<ResultApi<DeleteCartEntity>> deleteCart(String productId) async {
    final result = await _cartApi.deleteCart(productId);

    switch (result) {
      case Success<DeleteCartDto>():
        return Success<DeleteCartEntity>(result.data.toEntity());

      case AppError<DeleteCartDto>():
        return AppError<DeleteCartEntity>(result.messageError);
    }
  }
}
