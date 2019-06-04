import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  final Map<String, dynamic> _item;

  SwipeCard(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 40.0),
      height: 400,
      width: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/${_item['image']}'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        _item['title'],
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 1.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
