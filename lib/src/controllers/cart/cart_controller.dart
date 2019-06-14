import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/cart_model.dart';

class CartController with ChangeNotifier {
  List<CartModel> _cart = [];
}

class Cart extends CartController {
  List<CartModel> getCart() {
    return _cart;
  }
}

class CartService extends Cart {
  Random _id = new Random();
  addItemToCard(int productId, int quantity) {
    _cart.add(
      CartModel(
        id: _id.nextInt(1000),
        productId: productId,
        quantity: quantity,
      ),
    );
    notifyListeners();
  }
}
