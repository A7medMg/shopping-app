import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/cart/domain/entities/add_to_cart_entity.dart';
import 'package:shoppingapp/feature/cart/domain/repo/cart_repo_interface.dart';

@injectable
class AddToCartUseCase {
  final CartRepoInterface _repo;
  AddToCartUseCase(this._repo);

  Future<ResultApi<AddToCartEntity>> invoke(String productId) async =>
      await _repo.addToCart(productId);
}
