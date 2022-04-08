import 'package:flutter/cupertino.dart';

class Product{
  int? id;
  String? name;
  String? Category;
  String? description;
  double? price;
  bool? isFavorite;
  String? uploadDate;
  double? rating;
  String? image;

  Product(
      {this.id,
        @required this.name,
        @required this.Category,
        this.description,
        @required this.price,
        this.isFavorite =false,
        this.uploadDate,
        this.rating= 0.0,
        this.image
      }
  );

  @override
  String toString() {
    return 'Product{id: $id, name: $name, Category: $Category, description: $description, price: $price, isFavorite: $isFavorite, uploadDate: $uploadDate, rating: $rating, image: $image}';
  }

}