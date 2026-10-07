import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/domain/entities/category_entity.dart';
import 'package:shoppingapp/feature/home/domain/use_case/get_all_category_use_case.dart';
import 'package:shoppingapp/feature/home/domain/use_case/get_all_product_use_case.dart';
import 'package:shoppingapp/feature/home/domain/use_case/get_products_by_category_id.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllProductUseCase getAllProductUseCase;
  final GetAllProductByCategoryUseCase getAllProductByCategoryUseCase;
  final GetAllCategoryUseCase getAllCategoryUseCase;
  HomeCubit(this.getAllProductUseCase, this.getAllProductByCategoryUseCase, this.getAllCategoryUseCase) : super(ProductInitial());

  
  Future<void> getAllProduct() async {
    emit(ProductLoading());
    final result = await getAllProductUseCase.invoke();
    switch (result) {
      case Success<List<ProductEntity>>():
        emit(ProductSuccess(result.data));
      case AppError<List<ProductEntity>>():
        emit(ProductError(result.messageError));
    }
  }
  Future<void> getAllCategory() async {
    emit(CategoryLoading());
    final result = await getAllCategoryUseCase.invoke();
    switch (result) {
      case Success<List<CategoryEntity>>():
        emit(CategorySuccess(result.data));
      case AppError<List<CategoryEntity>>():
        emit(CategoryError(result.messageError));
    }
  }
  Future<void> getAllProductByCategory(String categoryId) async {
    emit(ProductLoading());
    final result = await getAllProductByCategoryUseCase.invoke(categoryId);
    switch (result) {
      case Success<List<ProductEntity>>():
        emit(ProductSuccess(result.data));
      case AppError<List<ProductEntity>>():
        emit(ProductError(result.messageError));
    }
  }
  Future<void> getHomeData() async {
    await getAllCategory();
    await getAllProduct();
  }

}
