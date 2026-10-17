import 'package:shoppingapp/feature/favorite/domain/entities/remove_fav_entity.dart';

class RemoveFavoriteDto {
  final String message;

  RemoveFavoriteDto({required this.message});

  factory RemoveFavoriteDto.fromJson(Map<String, dynamic> json) {
    return RemoveFavoriteDto(message: json['message'] ?? '');
  }

  RemoveFavoriteEntity toEntity() {
    return RemoveFavoriteEntity(message: message);
  }
}
