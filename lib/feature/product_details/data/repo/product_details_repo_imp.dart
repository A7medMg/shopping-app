import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/product_details/domain/entities/product_details_entity.dart';
import 'package:shoppingapp/feature/product_details/domain/repo/product_details_data_source_interface.dart';
import 'package:shoppingapp/feature/product_details/domain/repo/product_details_repo_interface.dart';

@Injectable(as: ProductDetailsRepoInterface)
class ProductDetailsRepoImp implements ProductDetailsRepoInterface {
  final ProductDetailsDataSourceInterface _dataSource;

  ProductDetailsRepoImp(this._dataSource);

  @override
  Future<ResultApi<ProductDetailsEntity>> getProductDetails(int productId) {
    return _dataSource.getProductDetails(productId);
  }
}
