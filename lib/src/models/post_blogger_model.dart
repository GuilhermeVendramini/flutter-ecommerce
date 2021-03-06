import 'package:flutter/material.dart';

class PostBloggerModel {
  final int id;
  final String image;
  final String title;
  final String name;
  final String logo;
  final String time;
  final String views;
  final String likes;
  final String subtitle;
  final String content;
  final int authorId;
  final List<Map<String, String>> gallery;

  PostBloggerModel({
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.name,
    @required this.logo,
    @required this.time,
    @required this.views,
    @required this.likes,
    @required this.subtitle,
    @required this.content,
    @required this.authorId,
    @required this.gallery,
  });
}
