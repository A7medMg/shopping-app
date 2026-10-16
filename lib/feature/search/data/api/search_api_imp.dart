import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/constants/api_constatnts.dart';
import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/network/api_error_handler.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/search/data/api/search_api.dart';

@Injectable(as: SearchApi)
class SearchApiImp implements SearchApi {
  final Dio _dio;

  SearchApiImp(this._dio);

  @override
  Future<ResultApi<ProductDto>> searchProducts(String query) async {
    try {
      final response = await _dio.post(
        ApiConstants.search,
        data: {'search': query, 'skip': 0, 'limit': 1000},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
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
