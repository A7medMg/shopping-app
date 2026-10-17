import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/favorite/domain/entities/add_to_fav_entity.dart';
import 'package:shoppingapp/feature/favorite/domain/repo/fav_repo_interface.dart';


@injectable
class AddToFavoriteUseCase {
  final FavoriteRepoInterface _repo;
  AddToFavoriteUseCase(this._repo);

  Future<ResultApi<AddFavoriteEntity>> invoke(String productId) async =>
      await _repo.addToFavorite(productId);
}
