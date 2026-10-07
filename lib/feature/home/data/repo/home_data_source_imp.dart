import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/data/api/home_api.dart';
import 'package:shoppingapp/feature/home/domain/entities/category_entity.dart';
import 'package:shoppingapp/feature/home/domain/repo/home_data_source_interface.dart';

@Injectable(as: HomeDataSourceInterface)
class HomeDataSourceImp implements HomeDataSourceInterface {
  final HomeApi _api;
  HomeDataSourceImp(this._api);

  @override
  Future<ResultApi<List<CategoryEntity>>> getAllCategory() async {
    final result = await _api.getAllCategories();
    switch (result) {
      case Success():
        return Success(result.data.toEntity());
      case AppError():
        return AppError(result.messageError);
    }
  }

  @override
  Future<ResultApi<List<ProductEntity>>> getAllProduct() async {
    final result = await _api.getAllProducts();
    switch (result) {
      case Success():
        return Success(result.data.toEntity());
      case AppError():
        return AppError(result.messageError);
    }
  }
}