import 'package:shoppingapp/feature/cart/domain/entities/delete_cart_entity.dart';

class DeleteCartDto {
  final String message;

  const DeleteCartDto({this.message = ''});

  factory DeleteCartDto.fromJson(Map<String, dynamic> json) {
    return DeleteCartDto(message: json['message']?.toString() ?? '');
  }

  DeleteCartEntity toEntity() {
    return DeleteCartEntity(message: message);
  }
}
