import 'package:flutter/material.dart';

class AuthorModel {
  final int id;
  final String name;
  final String logo;
  final String followers;
  final String slogan;

  AuthorModel({
    @required this.id,
    @required this.name,
    @required this.logo,
    @required this.followers,
    @required this.slogan,
  });
}
