import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/cart_item_model.dart';

class CartController with ChangeNotifier {
  List<CartItemModel> _cart = [];
  int _cartTotalItems = 0;
}

class Cart extends CartController {
  List<CartItemModel> get getCartItems {
    return _cart;
  }

  int get getCartTotalItems {
    return _cartTotalItems;
  }

  CartItemModel getCartProduct(int productId) {
    Iterable<CartItemModel> _item =
        _cart.where((item) => item.productId == productId);
    if (_item.length == 0) {
      return null;
    }
    return _item.toList().first;
  }
}

class CartService extends Cart {
  Random _id = new Random();

  addItemCard(int productId, int quantity) {
    final CartItemModel _item = getCartProduct(productId);
    if (_item != null) {
      _item.quantity++;
    } else {
      _cart.add(
        CartItemModel(
          id: _id.nextInt(1000),
          productId: productId,
          quantity: quantity,
        ),
      );
    }
    _cartTotalItems++;
    notifyListeners();
  }

  removeItemCard(int itemId) {
    _cart.removeWhere((item) {
      if (item.id == itemId) {
        _cartTotalItems -= item.quantity;
        return true;
      }
      return false;
    });
    notifyListeners();
  }

  removeQuantityItemCard(int productId) {
    final CartItemModel _item = getCartProduct(productId);
    if (_item.quantity == 0) {
      removeItemCard(_item.id);
    } else {
      _cartTotalItems--;
      _item.quantity--;
    }
    notifyListeners();
  }
}
