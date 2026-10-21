import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/cart/api/cart_api_interface.dart';
import 'package:shoppingapp/feature/cart/data/model/add_to_cart_dto.dart';
import 'package:shoppingapp/feature/cart/data/model/delete_cart_dto.dart';

@LazySingleton(as: CartApiInterface)
class CartApiImp implements CartApiInterface {
  final Dio _dio;

  CartApiImp(this._dio);

  String _errorMessage(Object error) {
    if (error is DioException) {
      final data = error.response?.data;

      if (data is Map) {
        return data['message']?.toString() ?? error.message ?? 'Request failed';
      }

      return error.message ?? 'Network error';
    }

    return error.toString();
  }

  @override
  Future<ResultApi<List<ProductDto>>> getCart() async {
    try {
      final response = await _dio.get('/user/getCart');
      final body = response.data;

      if (body is! Map) {
        return AppError<List<ProductDto>>('Invalid cart response from server');
      }

      if (body['success'] == false) {
        return AppError<List<ProductDto>>(
          body['message']?.toString() ?? 'Could not load cart',
        );
      }

      final dynamic data = body['data'] ?? body['cart'] ?? body;

      List<dynamic> products;

      if (data is List) {
        products = data;
      } else if (data is Map) {
        final dynamic rawProducts =
            data['products'] ?? data['cart'] ?? data['items'] ?? data['list'];

        if (rawProducts is List) {
          products = rawProducts;
        } else {
          return AppError<List<ProductDto>>(
            'Could not find products in cart response',
          );
        }
      } else {
        return AppError<List<ProductDto>>('Invalid cart products format');
      }

      final normalizedProducts = products.map((item) {
        if (item is Map && item['product'] is Map) {
          return Map<String, dynamic>.from(item['product'] as Map);
        }

        if (item is Map) {
          return Map<String, dynamic>.from(item);
        }

        throw const FormatException('Invalid product data');
      }).toList();

      return Success<List<ProductDto>>([
        ProductDto.fromJson({'list': normalizedProducts}),
      ]);
    } catch (error) {
      return AppError<List<ProductDto>>(_errorMessage(error));
    }
  }

  @override
  Future<ResultApi<AddToCartDto>> addToCart(String productId) async {
    return AppError<AddToCartDto>('Invalid URL');
  }

  @override
  Future<ResultApi<DeleteCartDto>> deleteCart(String productId) async {
    try {
      final response = await _dio.delete(
        '/user/deleteCart',
        data: {'productId': productId},
      );

      final body = response.data;

      if (body is! Map || body['success'] == false) {
        return AppError<DeleteCartDto>(
          body is Map
              ? body['message']?.toString() ?? 'Could not delete product'
              : 'Invalid server response',
        );
      }

      return Success<DeleteCartDto>(
        DeleteCartDto.fromJson(Map<String, dynamic>.from(body)),
      );
    } catch (error) {
      return AppError<DeleteCartDto>(_errorMessage(error));
    }
  }
}
