import 'package:flutter/material.dart';

class ProductButtonCard extends StatelessWidget {
  final bool _reachBottom;
  final Color _white;
  final Color _themeBlue;

  ProductButtonCard(this._reachBottom, this._white, this._themeBlue);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: _reachBottom ? _white : _themeBlue,
        border: Border.all(color: _themeBlue),
      ),
      child: _reachBottom
          ? Text(
              'ADD TO CARD',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: _themeBlue,
              ),
            )
          : Icon(Icons.shopping_cart),
    );
  }
}
