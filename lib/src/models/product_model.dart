import 'package:flutter/material.dart';

class ProductModel {
  final int id;
  final String image;
  final String title;
  final String description;
  final int brandId;
  final double price;
  final String logo;

  ProductModel({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.brandId,
    @required this.price,
    @required this.logo,
  });
}