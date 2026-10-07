import 'package:shoppingapp/feature/home/domain/entities/category_entity.dart';

class CategoryDto {
  List<CategoryItem>? category;

  CategoryDto({this.category});

  CategoryDto.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      category = <CategoryItem>[];
      json['list'].forEach((v) {
        category!.add(CategoryItem.fromJson(v));
      });
    }
  }
  List<CategoryEntity> toEntity() {
    return category?.map((e) => e.toEntity()).toList() ?? [];
  }
}

class CategoryItem {
  String? slug;
  String? name;
  String? url;
  String? image;

  CategoryItem({this.slug, this.name, this.url, this.image});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
    image = json['image'];
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      slug: slug ?? '',
      name: name ?? '',
      url: url ?? '',
      image: image ?? '',
    );
  }
}
