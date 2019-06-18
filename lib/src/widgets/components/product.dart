import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/cart/cart_controller.dart';
import 'package:provider/provider.dart';

class ProductButtonCard extends StatelessWidget {
  final int _productId;
  final bool _reachBottom;
  final Color _white;
  final Color _themeBlue;

  ProductButtonCard(this._productId, this._reachBottom, this._white, this._themeBlue);

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartService>(context);
    return GestureDetector(
      onTap: () {
        _cart.addItemCard(_productId, 1);
      },
      child: AnimatedContainer(
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
      ),
    );
  }
}
