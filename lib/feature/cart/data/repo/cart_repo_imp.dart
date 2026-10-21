import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/cart/domain/entities/add_to_cart_entity.dart';
import 'package:shoppingapp/feature/cart/domain/entities/delete_cart_entity.dart';
import 'package:shoppingapp/feature/cart/domain/repo/cart_data_source_interface.dart';
import 'package:shoppingapp/feature/cart/domain/repo/cart_repo_interface.dart';

@LazySingleton(as: CartRepoInterface)
class CartRepoImp implements CartRepoInterface {
  final CartDataSourceInterface _dataSource;

  CartRepoImp(this._dataSource);

  @override
  Future<ResultApi<List<ProductEntity>>> getCart() {
    return _dataSource.getCart();
  }

  @override
  Future<ResultApi<AddToCartEntity>> addToCart(String productId) {
    return _dataSource.addToCart(productId);
  }

  @override
  Future<ResultApi<DeleteCartEntity>> deleteCart(String productId) {
    return _dataSource.deleteCart(productId);
  }
}
