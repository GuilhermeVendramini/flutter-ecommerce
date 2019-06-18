import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/screens/cart_screen.dart';

class CartHeader extends StatelessWidget {
  final int _cartTotalItems;

  CartHeader(this._cartTotalItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      child: GestureDetector(
        onTap: () {
          Route route = MaterialPageRoute(
            builder: (context) => CartScreen(),
          );
          Navigator.push(context, route);
        },
        child: Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: null,
            ),
            _cartTotalItems == 0
                ? Container()
                : Positioned(
                    top: 3.0,
                    right: 2.0,
                    child: Stack(
                      children: <Widget>[
                        Icon(
                          Icons.brightness_1,
                          color: Theme.of(context).buttonColor,
                        ),
                        Positioned(
                          top: 3,
                          right: 3,
                          child: Text(
                            _cartTotalItems.toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
