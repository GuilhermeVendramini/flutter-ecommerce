import 'package:flutter/material.dart';

class SaleModel {
  final int id;
  final String image;
  final String title;
  final String description;
  final int brandId;
  final int productId;

  SaleModel({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.brandId,
    @required this.productId,
  });
}