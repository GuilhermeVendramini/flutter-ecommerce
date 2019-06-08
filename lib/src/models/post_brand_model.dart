import 'package:flutter/material.dart';

class PostBrandModel {
  final int id;
  final String image;
  final String title;
  final String brand;
  final int brandId;
  final String logo;
  final String time;
  final String views;
  final String likes;
  final String subtitle;
  final String content;
  final List<Map<String, String>> gallery;

  PostBrandModel({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.brand,
    @required this.brandId,
    @required this.logo,
    @required this.time,
    @required this.views,
    @required this.likes,
    @required this.subtitle,
    @required this.content,
    @required this.gallery,
  });
}
