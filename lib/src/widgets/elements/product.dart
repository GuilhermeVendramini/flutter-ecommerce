import 'package:flutter/material.dart';

class ProductCircularColor extends StatelessWidget {
  final Color _color;

  ProductCircularColor(this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
