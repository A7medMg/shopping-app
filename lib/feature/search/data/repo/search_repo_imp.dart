import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/search/domain/repo/search_data_source_interface.dart';
import 'package:shoppingapp/feature/search/domain/repo/search_repo_interface.dart';

@Injectable(as: SearchRepoInterface)
class SearchRepoImp implements SearchRepoInterface {
  final SearchDataSourceInterface _dataSource;

  SearchRepoImp(this._dataSource);

  @override
  Future<ResultApi<List<ProductEntity>>> searchProducts(String query) async {
    return await _dataSource.searchProducts(query);
  }
}
