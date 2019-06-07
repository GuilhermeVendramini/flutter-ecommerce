import 'package:flutter/material.dart';

class TrendModel {
  final int id;
  final String image;
  final String title;
  final String brand;
  final String logo;
  final String time;
  final String views;
  final String likes;
  final String subtitle;
  final String content;

  TrendModel({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.brand,
    @required this.logo,
    @required this.time,
    @required this.views,
    @required this.likes,
    @required this.subtitle,
    @required this.content,
  });
}
