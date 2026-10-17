import 'package:shoppingapp/feature/favorite/domain/entities/add_to_fav_entity.dart';

class AddToFavoriteDto {
  final String message;

  AddToFavoriteDto({required this.message});

  factory AddToFavoriteDto.fromJson(Map<String, dynamic> json) {
    return AddToFavoriteDto(message: json['message'] ?? '');
  }

  AddFavoriteEntity toEntity() {
    return AddFavoriteEntity(message: message);
  }
}
