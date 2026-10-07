import 'package:shoppingapp/core/models/item/product_entity.dart';

class ProductDto {
  List<ProductItem>? products;

  ProductDto({this.products});

  ProductDto.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      products = [];
      json['list'].forEach((v) {
        products!.add(ProductItem.fromJson(v));
      });
    }
  }

  List<ProductEntity> toEntity() {
    return products?.map((e) => e.toEntity()).toList() ?? [];
  }
}

class ProductItem {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? images;

  ProductItem({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.images,
  });

  ProductItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = (json['price'] as num?)?.toDouble();
    discountPercentage = (json['discountPercentage'] as num?)?.toDouble();
    rating = (json['rating'] as num?)?.toDouble();
    stock = json['stock'];
    images = (json['images'] as List?)?.cast<String>();
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      category: category ?? '',
      price: price ?? 0,
      discount: discountPercentage ?? 0,
      rating: rating ?? 0,
      stock: stock ?? 0,
      images: images ?? [],
    );
  }
}
