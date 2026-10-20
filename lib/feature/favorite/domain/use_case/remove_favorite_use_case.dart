import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/favorite/domain/entities/remove_fav_entity.dart';
import 'package:shoppingapp/feature/favorite/domain/repo/fav_repo_interface.dart';


@injectable
class RemoveFavoriteUseCase {
  final FavoriteRepoInterface _repo;
  RemoveFavoriteUseCase(this._repo);

  Future<ResultApi<RemoveFavoriteEntity>> invoke(String productId) async =>
      await _repo.removeFavorite(productId);
}
