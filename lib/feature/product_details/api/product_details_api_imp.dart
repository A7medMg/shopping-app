import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/constants/api_constatnts.dart';
import 'package:shoppingapp/core/network/api_error_handler.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/product_details/data/api/product_details_api.dart';
import 'package:shoppingapp/feature/product_details/data/models/product_details_dto.dart';

@Injectable(as: ProductDetailsApi)
class ProductDetailsApiImpl implements ProductDetailsApi {
  final Dio _dio;

  ProductDetailsApiImpl(this._dio);

  @override
  Future<ResultApi<ProductDetailsDto>> getProductDetails(int productId) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.getProductDetails}/$productId',
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Success(
          ProductDetailsDto.fromJson(Map<String, dynamic>.from(response.data)),
        );
      }

      return AppError('Server Error');
    } on DioException catch (e) {
      return AppError(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError(e.toString());
    }
  }
}
