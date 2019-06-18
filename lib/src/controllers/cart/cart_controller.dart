import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/cart_item_model.dart';
import 'package:flutter_ecommerce/src/models/product_model.dart';

class CartController with ChangeNotifier {
  List<CartItemModel> _cart = [];
  int _cartTotalItems = 0;
  double _totalOrder = 0.0;
}

class Cart extends CartController {
  List<CartItemModel> get getCartItems {
    return _cart;
  }

  int get getCartTotalItems {
    return _cartTotalItems;
  }

  double get getTotalOrder {
    return _totalOrder;
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

  addItemCard(ProductModel product, int quantity) {
    final CartItemModel _item = getCartProduct(product.id);
    if (_item != null) {
      _item.quantity++;
    } else {
      _cart.add(
        CartItemModel(
          id: _id.nextInt(1000),
          productId: product.id,
          quantity: quantity,
        ),
      );
    }
    _cartTotalItems++;
    _totalOrder += product.price;
    notifyListeners();
  }

  removeItemCard(ProductModel product) {
    _cart.removeWhere((item) {
      if (item.productId == product.id) {
        _cartTotalItems -= item.quantity;
        _totalOrder -= item.quantity * product.price;
        return true;
      }
      return false;
    });
    notifyListeners();
  }

  removeQuantityItemCard(ProductModel product) {
    final CartItemModel _item = getCartProduct(product.id);
    if (_item.quantity == 0) {
      removeItemCard(product);
    } else {
      _totalOrder -= product.price;
      _cartTotalItems--;
      _item.quantity--;
    }
    notifyListeners();
  }
}
