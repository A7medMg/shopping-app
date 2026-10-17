import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/favorite/domain/repo/fav_repo_interface.dart';


@injectable
class GetFavoriteUseCase {
  final FavoriteRepoInterface _repo;
  GetFavoriteUseCase(this._repo);

  Future<ResultApi<List<ProductEntity>>> invoke() async => _repo.getFavorite();
}
