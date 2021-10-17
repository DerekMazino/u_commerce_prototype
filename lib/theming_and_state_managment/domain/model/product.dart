import 'dart:convert';

class Product {
  Product(
      {required this.description,
      required this.available,
      required this.image,
      required this.name,
      required this.price,
      this.id});
  String description;
  bool available;
  String image;
  String name;
  double price;
  String? id;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap()); //Para mandarlo al servidor

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        description: json["description"],
        available: json["available"],
        image: json["image"],
        name: json["name"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "available": available,
        "image": image,
        "name": name,
        "price": price,
      };

  Product copy() => Product(
      description: this.description,
      available: this.available,
      name: this.name,
      price: this.price,
      image: this.image,
      id: this.id);
}
