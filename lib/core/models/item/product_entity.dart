class ProductEntity {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discount;
  double rating;
  int stock;
  List<String> images;

  ProductEntity({
    this.id = 1,
    this.title = 'empty titile',
    this.description = 'empty description',
    this.category = 'empty category',
    this.price = 0.0,
    this.discount = 0.0,
    this.rating = 0.0,
    this.stock = 0,
    this.images = const [],
  });
}
