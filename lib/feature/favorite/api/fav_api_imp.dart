import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/constants/api_constatnts.dart';
import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/network/api_error_handler.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/favorite/api/fav_api_interface.dart';
import 'package:shoppingapp/feature/favorite/data/model/add_to_fav_dto.dart';
import 'package:shoppingapp/feature/favorite/data/model/remove_fav_dto.dart';
@Injectable(as: FavoriteApiInterface)
class FavoriteApiImp implements FavoriteApiInterface {
   final Dio dio;
  FavoriteApiImp(this.dio);
   @override
  Future<ResultApi<List<ProductDto>>> getFavorite()async {
  try {
      var response = await dio.get(ApiConstants.getFavorite);
      var json = response.data;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        var fav = ProductDto.fromJson(json);
        return Success<List<ProductDto>>([fav]);
      } else {
        return AppError("Server Error");
      }
    } on DioException catch (e) {
      return AppError(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError(e.toString());
    }
  }
  @override
  Future<ResultApi<AddToFavoriteDto>> addToFavorite(String productId)async {
     try {
      var response = await dio.post(
        ApiConstants.addToFavorite,
        data: {"productId": productId},
      );
      var json = response.data;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        var result = AddToFavoriteDto.fromJson(json);
        return Success<AddToFavoriteDto>(result);
      } else {
        return AppError<AddToFavoriteDto>("Server Error");
      }
    } on DioException catch (e) {
      return AppError<AddToFavoriteDto>(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError<AddToFavoriteDto>(e.toString());
    }
  }

 

  @override
  Future<ResultApi<RemoveFavoriteDto>> removeFavorite(String productId) async {
     try {
      var response = await dio.delete(
        ApiConstants.removeFavorite,
        data: {"productId": productId},
      );

      var json = response.data;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        var result = RemoveFavoriteDto.fromJson(json);
        return Success<RemoveFavoriteDto>(result);
      } else {
        return AppError<RemoveFavoriteDto>('Server Error');
      }
    } on DioException catch (e) {
      return AppError<RemoveFavoriteDto>(ApiErrorHandler.getMessage(e));
    } catch (e) {
      return AppError<RemoveFavoriteDto>(e.toString());
    }
  }
}