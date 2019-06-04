import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/trend_model.dart';

class TrendsCard extends StatelessWidget {
  final TrendModel _item;

  TrendsCard(this._item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 40.0),
        height: 600,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(_item.image),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(
          _item.title,
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
      ),
    );
  }
}
