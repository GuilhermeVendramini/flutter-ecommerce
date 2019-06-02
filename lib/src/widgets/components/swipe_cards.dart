import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  final Map<String, dynamic> _item;

  SwipeCard(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/${_item['image']}'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
    );
  }
}
