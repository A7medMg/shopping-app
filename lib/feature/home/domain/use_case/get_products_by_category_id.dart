import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/domain/repo/home_repo_interface.dart';

@injectable
class GetAllProductByCategoryUseCase {
  final HomeRepoInterface _repo;
  GetAllProductByCategoryUseCase(this._repo);

  Future<ResultApi<List<ProductEntity>>> invoke(String categoryId) async =>
      await _repo.getAllProductByCategory(categoryId);
}
