import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/search/data/api/search_api.dart';
import 'package:shoppingapp/feature/search/domain/repo/search_data_source_interface.dart';

@Injectable(as: SearchDataSourceInterface)
class SearchDataSourceImp implements SearchDataSourceInterface {
  final SearchApi _api;

  SearchDataSourceImp(this._api);

  @override
  Future<ResultApi<List<ProductEntity>>> searchProducts(String query) async {
    final result = await _api.searchProducts(query);

    switch (result) {
      case Success():
        return Success(result.data.toEntity());

      case AppError():
        return AppError(result.messageError);
    }
  }
}
