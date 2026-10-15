import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/domain/entities/category_entity.dart';
import 'package:shoppingapp/feature/home/domain/repo/home_repo_interface.dart';

@injectable
class GetAllCategoryUseCase {
  final HomeRepoInterface _repo;
  GetAllCategoryUseCase(this._repo);

  Future<ResultApi<List<CategoryEntity>>> invoke() async =>
      await _repo.getAllCategory();
}
