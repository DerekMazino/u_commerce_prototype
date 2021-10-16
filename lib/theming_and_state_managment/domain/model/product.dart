class Product {
  Product({
    required this.available,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  final bool available;
  final String image;
  final String name;
  final String description;
  final int price;
}
