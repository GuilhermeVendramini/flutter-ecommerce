import 'package:flutter/material.dart';

class TrendModel {
  final String image;
  final String title;
  final String brand;
  final String logo;
  final String time;
  final String views;
  final String likes;

  TrendModel({
    @required this.image,
    @required this.title,
    @required this.brand,
    @required this.logo,
    @required this.time,
    @required this.views,
    @required this.likes,
  });
}
