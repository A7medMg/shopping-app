import 'package:shoppingapp/feature/product_details/data/models/product_details_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/product_details/data/api/product_details_api.dart';
import 'package:shoppingapp/feature/product_details/domain/entities/product_details_entity.dart';
import 'package:shoppingapp/feature/product_details/domain/repo/product_details_data_source_interface.dart';

@Injectable(as: ProductDetailsDataSourceInterface)
class ProductDetailsDataSourceImp implements ProductDetailsDataSourceInterface {
  final ProductDetailsApi _api;

  ProductDetailsDataSourceImp(this._api);

  @override
  Future<ResultApi<ProductDetailsEntity>> getProductDetails(
    int productId,
  ) async {
    final result = await _api.getProductDetails(productId);

    if (result is Success<ProductDetailsDto>) {
      return Success<ProductDetailsEntity>(result.data.toEntity());
    }

    if (result is AppError<ProductDetailsDto>) {
      return AppError<ProductDetailsEntity>(result.messageError);
    }

    return AppError<ProductDetailsEntity>('Unexpected API result');
  }
}
