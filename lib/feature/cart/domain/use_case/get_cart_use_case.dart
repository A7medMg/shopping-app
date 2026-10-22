import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/cart/domain/repo/cart_repo_interface.dart';

@injectable
class GetCartUseCase {
  final CartRepoInterface _repo;
  GetCartUseCase(this._repo);

  Future<ResultApi<List<ProductEntity>>> invoke() async => _repo.getCart();
}
