import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/cart/domain/entities/delete_cart_entity.dart';
import 'package:shoppingapp/feature/cart/domain/repo/cart_repo_interface.dart';

@injectable
class DeleteCartUseCase {
  final CartRepoInterface _repo;
  DeleteCartUseCase(this._repo);

  Future<ResultApi<DeleteCartEntity>> invoke(String productId) async =>
      await _repo.deleteCart(productId);
}
