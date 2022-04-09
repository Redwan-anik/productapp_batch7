import 'package:flutter/cupertino.dart';

class Product{
  int? id;
  String? name;
  String? Category;
  String? description;
  double? price;
  bool? isFavorite;
  String? formattedDate;
  int? uploadedMonth;
  int? uploadedYear;
  int? timeStamp;
  double? rating;
  String? image;

  Product(
      {this.id,
        @required this.name,
        @required this.Category,
        this.description,
        @required this.price,
        this.isFavorite =false,
        this.formattedDate,
        this.rating= 0.0,
        this.image
      }
  );

  @override
  String toString() {
    return 'Product{id: $id, name: $name, Category: $Category, description: $description, price: $price, isFavorite: $isFavorite, uploadDate: $formattedDate, rating: $rating, image: $image}';
  }

}