// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String ProductModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.id,
    required this.isFavourite,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
  });
  String image;
  String id;
  bool isFavourite;
  String name;
  double price;
  String description;
  String status;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json["image"],
        id: json["id"],
        isFavourite: false,
        name: json["name"],
        price: double.parse(json["price"].toString()),
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
        "name": name,
        "status": status,
        "description": description,
        "price": price,
        "isFavourite": isFavourite,
      };
}
