import 'package:shoppingapp/feature/cart/domain/entities/add_to_cart_entity.dart';

class AddToCartDto {
  final String message;

  const AddToCartDto({this.message = ''});

  factory AddToCartDto.fromJson(Map<String, dynamic> json) {
    return AddToCartDto(message: json['message']?.toString() ?? '');
  }

  AddToCartEntity toEntity() {
    return AddToCartEntity(message: message);
  }
}
