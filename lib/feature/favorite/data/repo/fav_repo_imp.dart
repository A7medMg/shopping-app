import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/favorite/domain/entities/add_to_fav_entity.dart';
import 'package:shoppingapp/feature/favorite/domain/entities/remove_fav_entity.dart';
import 'package:shoppingapp/feature/favorite/domain/repo/fav_data_source_interface.dart' show FavoriteDataSourceInterface;
import 'package:shoppingapp/feature/favorite/domain/repo/fav_repo_interface.dart';


@Injectable(as: FavoriteRepoInterface)
class FavoriteRepoImp implements FavoriteRepoInterface {
  final FavoriteDataSourceInterface _dataSource;
  FavoriteRepoImp(this._dataSource);

  @override
  Future<ResultApi<List<ProductEntity>>> getFavorite() async =>
      await _dataSource.getFavorite();

  @override
  Future<ResultApi<AddFavoriteEntity>> addToFavorite(String productId) async =>
      await _dataSource.addToFavorite(productId);

  @override
  Future<ResultApi<RemoveFavoriteEntity>> removeFavorite(
    String productId,
  ) async => await _dataSource.removeFavorite(productId);
}
