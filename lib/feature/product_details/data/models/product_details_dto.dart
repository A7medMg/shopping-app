import 'package:shoppingapp/feature/product_details/domain/entities/product_details_entity.dart';

class ProductDetailsDto {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> images;
  final String thumbnail;
  final List<ProductReviewEntity> reviews;

  const ProductDetailsDto({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.images,
    required this.thumbnail,
    required this.reviews,
  });

  factory ProductDetailsDto.fromJson(Map<String, dynamic> json) {
    final reviewsJson = json['reviews'] as List? ?? [];

    return ProductDetailsDto(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] as int? ?? 0,
      images: (json['images'] as List?)?.whereType<String>().toList() ?? [],
      thumbnail: json['thumbnail'] as String? ?? '',
      reviews: reviewsJson
          .whereType<Map<String, dynamic>>()
          .map(
            (review) => ProductReviewEntity(
              rating: review['rating'] as int? ?? 0,
              comment: review['comment'] as String? ?? '',
              reviewerName: review['reviewerName'] as String? ?? '',
              date: review['date'] as String? ?? '',
            ),
          )
          .toList(),
    );
  }

  ProductDetailsEntity toEntity() {
    return ProductDetailsEntity(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      images: images,
      thumbnail: thumbnail,
      reviews: reviews,
    );
  }
}
