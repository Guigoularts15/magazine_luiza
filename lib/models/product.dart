class Product {
  final String productName;
  final String photo;
  final String description;
  final String price;
  final String timesPrice;
  bool isFavorite;

  Product({
    required this.productName,
    required this.photo,
    required this.description,
    required this.price,
    required this.timesPrice,
    this.isFavorite = false,
  });
}
