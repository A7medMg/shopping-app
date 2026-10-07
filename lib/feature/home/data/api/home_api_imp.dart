import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/constants/api_constatnts.dart';
import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/network/api_error_handler.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/data/api/home_api.dart';
import 'package:shoppingapp/feature/home/data/models/category_model_dto.dart';

@Injectable(as: HomeApi)
class HomeApiImp implements HomeApi {
  final Dio _dio;

  HomeApiImp(this._dio);

  @override
  Future<ResultApi<CategoryDto>> getAllCategories() async {
    try {
      final response = await _dio.get(ApiConstants.getAllCategories);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Success(CategoryDto.fromJson(response.data));
      }

      return AppError('Server Error');
    } on DioException catch (e) {
      return AppError(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError(e.toString());
    }
  }

  @override
  Future<ResultApi<ProductDto>> getAllProducts() async {
    try {
      final response = await _dio.get(ApiConstants.getAllProduct);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Success(ProductDto.fromJson(response.data));
      }

      return AppError('Server Error');
    } on DioException catch (e) {
      return AppError(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError(e.toString());
    }
  }

  @override
  Future<ResultApi<ProductDto>> getAllProductsByCategory(String categoryId) async {
    try {
      final response = await _dio.get( '${ApiConstants.getProByCategory}/$categoryId',
    queryParameters: {
      'skip': 0,
      'limit': 5,
    },);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Success(ProductDto.fromJson(response.data));
      }

      return AppError('Server Error');
    } on DioException catch (e) {
      return AppError(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError(e.toString());
    }
  }
}
