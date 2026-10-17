import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_dto.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/favorite/api/fav_api_interface.dart';
import 'package:shoppingapp/feature/favorite/data/model/add_to_fav_dto.dart';
import 'package:shoppingapp/feature/favorite/data/model/remove_fav_dto.dart';
import 'package:shoppingapp/feature/favorite/domain/entities/add_to_fav_entity.dart';
import 'package:shoppingapp/feature/favorite/domain/entities/remove_fav_entity.dart';
import 'package:shoppingapp/feature/favorite/domain/repo/fav_data_source_interface.dart';

@Injectable(as: FavoriteDataSourceInterface)
class FavoriteDataSourceImp implements FavoriteDataSourceInterface {
  final FavoriteApiInterface _favoriteApi;

  FavoriteDataSourceImp(this._favoriteApi);

  @override
  Future<ResultApi<List<ProductEntity>>> getFavorite() async {
    final result = await _favoriteApi.getFavorite();
    switch (result) {
      case Success<List<ProductDto>>():
        return Success<List<ProductEntity>>(result.data.first.toEntity());
      case AppError<List<ProductDto>>():
        return AppError<List<ProductEntity>>(result.messageError);
    }
  }

  @override
  Future<ResultApi<AddFavoriteEntity>> addToFavorite(String productId) async {
    final result = await _favoriteApi.addToFavorite(productId);
    switch (result) {
      case Success<AddToFavoriteDto>():
        return Success<AddFavoriteEntity>(result.data.toEntity());
      case AppError<AddToFavoriteDto>():
        return AppError<AddFavoriteEntity>(result.messageError);
    }
  }

  @override
  Future<ResultApi<RemoveFavoriteEntity>> removeFavorite(
    String productId,
  ) async {
    final result = await _favoriteApi.removeFavorite(productId);
    switch (result) {
      case Success<RemoveFavoriteDto>():
        return Success<RemoveFavoriteEntity>(result.data.toEntity());
      case AppError<RemoveFavoriteDto>():
        return AppError<RemoveFavoriteEntity>(result.messageError);
    }
  }
}
