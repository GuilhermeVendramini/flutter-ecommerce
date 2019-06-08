import 'package:flutter/material.dart';

class BrandModel {
  final int id;
  final String title;
  final String logo;
  final String followers;
  final String slogan;

  BrandModel({
    @required this.id,
    @required this.title,
    @required this.logo,
    @required this.followers,
    @required this.slogan,
  });
}
