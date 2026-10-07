import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/domain/repo/home_repo_interface.dart';

@injectable
class GetAllProductUseCase {
  final HomeRepoInterface _repo;
  GetAllProductUseCase(this._repo);

  Future<ResultApi<List<ProductEntity>>> invoke() async =>
      await _repo.getAllProduct();
}
