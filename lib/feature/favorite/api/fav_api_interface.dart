import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/favorite/data/model/add_to_fav_dto.dart';
import 'package:shoppingapp/feature/favorite/data/model/remove_fav_dto.dart';

abstract interface class FavoriteApiInterface {
  Future<ResultApi<List<ProductDto>>> getFavorite();
  Future<ResultApi<AddToFavoriteDto>> addToFavorite(String productId);
  Future<ResultApi<RemoveFavoriteDto>> removeFavorite(String productId);
}