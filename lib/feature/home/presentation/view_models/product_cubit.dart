import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/home/domain/use_case/get_all_product_use_case.dart';
import 'package:shoppingapp/feature/home/presentation/view_models/product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetAllProductUseCase getAllProductUseCase;
  ProductCubit(this.getAllProductUseCase) : super(ProductInitial());

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
}
