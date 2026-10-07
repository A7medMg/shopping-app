import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/constants/api_constatnts.dart';
import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_error_handler.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/data/models/category_model_dto.dart';
import 'package:shoppingapp/feature/home/domain/entities/category_entity.dart';
import 'package:shoppingapp/feature/home/domain/repo/home_data_source_interface.dart';

@Injectable(as: HomeDataSourceInterface)
class HomeDataSourceImp implements HomeDataSourceInterface {
  final Dio dio;

  HomeDataSourceImp(this.dio);

  @override
  Future<ResultApi<List<CategoryEntity>>> getAllCategory() async {
    try {
      var response = await dio.get(ApiConstants.getAllCategories);
      var json = response.data;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final category = CategoryDto.fromJson(json);
        return Success<List<CategoryEntity>>(category.toEntity());
      } else {
        return AppError<List<CategoryEntity>>('Error Server');
      }
    } on DioException catch (e) {
      return AppError<List<CategoryEntity>>(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError<List<CategoryEntity>>(e.toString());
    }
  }

  @override
  Future<ResultApi<List<ProductEntity>>> getAllProduct() async {
    try {
      var response = await dio.get(ApiConstants.getAllProduct);
      var json = response.data;

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        var product = ProductDto.fromJson(json);
        return Success<List<ProductEntity>>(product.toEntity());
      } else {
        return AppError<List<ProductEntity>>('Server Error');
      }
    } on DioException catch (e) {
      return AppError<List<ProductEntity>>(
        e.response?.data.toString() ?? e.message ?? 'Error',
      );
    } catch (e) {
      return AppError<List<ProductEntity>>(e.toString());
    }
  }
}
