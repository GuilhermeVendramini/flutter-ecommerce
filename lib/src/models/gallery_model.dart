import 'package:flutter/material.dart';

class GalleryModel {
  final String image;
  final String title;
  final String description;

  GalleryModel({
    @required this.image,
    this.title,
    this.description,
  });
}
