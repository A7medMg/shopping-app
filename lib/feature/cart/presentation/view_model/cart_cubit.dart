import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppingapp/core/models/item/product_entity.dart';
import 'package:shoppingapp/core/network/api_result.dart';
import 'package:shoppingapp/feature/cart/domain/entities/add_to_cart_entity.dart';
import 'package:shoppingapp/feature/cart/domain/entities/delete_cart_entity.dart';
import 'package:shoppingapp/feature/cart/domain/use_case/add_to_cart_use_case.dart';
import 'package:shoppingapp/feature/cart/domain/use_case/delete_cart_use_case.dart';
import 'package:shoppingapp/feature/cart/domain/use_case/get_cart_use_case.dart';
import 'package:shoppingapp/feature/cart/presentation/view_model/cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final GetCartUseCase _getCartUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final DeleteCartUseCase _deleteCartUseCase;

  CartCubit(
    this._getCartUseCase,
    this._addToCartUseCase,
    this._deleteCartUseCase,
  ) : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());
    print('CART: Loading started');

    try {
      final result = await _getCartUseCase.invoke();

      switch (result) {
        case Success<List<ProductEntity>>():
          print('CART: Success - ${result.data.length} products');
          emit(CartSuccess(result.data));

        case AppError<List<ProductEntity>>():
          print('CART: API Error - ${result.messageError}');
          emit(CartError(result.messageError));
      }
    } catch (e, stackTrace) {
      print('CART: Exception - $e');
      print(stackTrace);
      emit(CartError(e.toString()));
    }
  }

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading());

    try {
      final result = await _addToCartUseCase.invoke(productId);

      switch (result) {
        case Success<AddToCartEntity>():
          emit(AddToCartSuccess());

        case AppError<AddToCartEntity>():
          emit(AddToCartError(result.messageError));
      }
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }

  Future<void> deleteCart(String productId) async {
    emit(RemoveCartLoading());

    try {
      final result = await _deleteCartUseCase.invoke(productId);

      switch (result) {
        case Success<DeleteCartEntity>():
          emit(RemoveCartSuccess(result.data.message));

        case AppError<DeleteCartEntity>():
          emit(RemoveCartError(result.messageError));
      }
    } catch (e) {
      emit(RemoveCartError(e.toString()));
    }
  }
}
