import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/search/domain/repo/search_repo_interface.dart';

@injectable
class SearchProductsUseCase {
  final SearchRepoInterface _repo;

  SearchProductsUseCase(this._repo);

  Future<ResultApi<List<ProductEntity>>> invoke(String query) async {
    return await _repo.searchProducts(query);
  }
}
