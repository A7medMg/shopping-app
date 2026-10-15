import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/domain/entities/category_entity.dart';
import 'package:shoppingapp/feature/home/domain/repo/home_data_source_interface.dart';
import 'package:shoppingapp/feature/home/domain/repo/home_repo_interface.dart';

@Injectable(as: HomeRepoInterface)
class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface _dataSource;
  HomeRepoImp(this._dataSource);
  @override
  Future<ResultApi<List<CategoryEntity>>> getAllCategory() async =>
      await _dataSource.getAllCategory();

  @override
  Future<ResultApi<List<ProductEntity>>> getAllProduct() async =>
      await _dataSource.getAllProduct();

  @override
  Future<ResultApi<List<ProductEntity>>> getAllProductByCategory(String categoryId)async =>
      await _dataSource.getAllProductByCategory(categoryId);
  }

