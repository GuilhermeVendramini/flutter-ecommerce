import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/slider_model.dart';

class ProductModel {
  final int id;
  final String image;
  final String title;
  final String description;
  final String brandName;
  final int brandId;
  final double price;
  final String logo;
  final String specification;
  final List<SliderModel> gallery;

  ProductModel({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.brandName,
    @required this.brandId,
    @required this.price,
    @required this.logo,
    @required this.specification,
    @required this.gallery,
  });
}
