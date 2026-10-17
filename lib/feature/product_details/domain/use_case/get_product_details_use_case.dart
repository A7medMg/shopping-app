import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/product_details/domain/entities/product_details_entity.dart';
import 'package:shoppingapp/feature/product_details/domain/repo/product_details_repo_interface.dart';

@injectable
class GetProductDetailsUseCase {
  final ProductDetailsRepoInterface _repo;

  GetProductDetailsUseCase(this._repo);

  Future<ResultApi<ProductDetailsEntity>> invoke(int productId) {
    return _repo.getProductDetails(productId);
  }
}
