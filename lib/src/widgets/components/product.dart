import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/cart/cart_controller.dart';
import 'package:flutter_ecommerce/src/controllers/products/products_controller.dart';
import 'package:flutter_ecommerce/src/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class ProductButtonCard extends StatefulWidget {
  final int _productId;
  final bool _reachBottom;

  ProductButtonCard(this._productId, this._reachBottom);

  @override
  State<StatefulWidget> createState() => _ProductButtonCardState();
}

class _ProductButtonCardState extends State<ProductButtonCard> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Icon(
              Icons.check,
              size: 80.0,
              color: Theme.of(context).buttonColor,
            ),
          ),
          content: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              _goToCheckout(),
              SizedBox(
                height: 20.0,
                width: 20.0,
              ),
              _keepShopping(),
            ],
          ),
        );
      },
    );
  }

  Widget _goToCheckout() {
    return Container(
      height: 50.0,
      width: 300.0,
      child: RaisedButton(
        child: Text(
          'GO TO CHECKOUT',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          Route route = MaterialPageRoute(
            builder: (context) => CartScreen(),
          );
          Navigator.push(context, route);
        },
      ),
    );
  }

  Widget _keepShopping() {
    return Container(
      height: 50.0,
      width: 300.0,
      child: RaisedButton(
        child: Text(
          'KEEP SHOPPING',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartService>(context);
    final _products = Provider.of<ProductsService>(context);
    final _product = _products.getProduct(widget._productId);
    return Container(
      height: 50.0,
      width: widget._reachBottom ? 300.0 : 80.0,
      child: RaisedButton(
        child: widget._reachBottom
            ? Text(
                'ADD TO CART',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              )
            : Icon(Icons.shopping_cart),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {
          _showDialog();
          _cart.addItemCard(_product, 1);
        },
      ),
    );
  }
}
