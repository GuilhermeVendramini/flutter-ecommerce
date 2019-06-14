import 'package:flutter/material.dart';

class CartModel {
  final int id;
  final int productId;
  final int quantity;

  CartModel({
    @required this.id,
    @required this.productId,
    @required this.quantity,
  });
}
