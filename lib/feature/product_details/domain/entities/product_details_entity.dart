class ProductDetailsEntity {
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

  const ProductDetailsEntity({
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
}

class ProductReviewEntity {
  final int rating;
  final String comment;
  final String reviewerName;
  final String date;

  const ProductReviewEntity({
    required this.rating,
    required this.comment,
    required this.reviewerName,
    required this.date,
  });
}
