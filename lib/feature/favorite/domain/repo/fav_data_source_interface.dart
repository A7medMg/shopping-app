

import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/favorite/domain/entities/add_to_fav_entity.dart';
import 'package:shoppingapp/feature/favorite/domain/entities/remove_fav_entity.dart';

abstract interface class FavoriteDataSourceInterface {
  Future<ResultApi<List<ProductEntity>>> getFavorite();

  Future<ResultApi<AddFavoriteEntity>> addToFavorite(String productId);

  Future<ResultApi<RemoveFavoriteEntity>> removeFavorite(String productId);
}
// 