import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/cart/cart_controller.dart';
import 'package:flutter_ecommerce/src/controllers/products/products_controller.dart';
import 'package:provider/provider.dart';

class ProductButtonCard extends StatefulWidget {
  final int _productId;
  final bool _reachBottom;

  ProductButtonCard(this._productId, this._reachBottom);

  @override
  State<StatefulWidget> createState() => _ProductButtonCardState();
}

class _ProductButtonCardState extends State<ProductButtonCard> {
  Color _color = Colors.white;
  Color _themeBlue = ThemeData.dark().buttonColor;

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartService>(context);
    final _products = Provider.of<ProductsService>(context);
    final _product = _products.getProduct(widget._productId);
    return GestureDetector(
      onTap: () {
        _cart.addItemCard(_product, 1);
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            _color = Colors.white;
            _themeBlue = Theme.of(context).buttonColor;
          });
        });
        setState(() {
          _color = Colors.white.withOpacity(0.6);
          _themeBlue = Theme.of(context).buttonColor.withOpacity(0.6);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: widget._reachBottom ? _color : _themeBlue,
          border: Border.all(color: _themeBlue),
        ),
        child: widget._reachBottom
            ? Text(
                'ADD TO CART',
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
