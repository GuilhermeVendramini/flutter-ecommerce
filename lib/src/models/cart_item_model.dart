import 'package:flutter/material.dart';

class CartItemModel {
  final int id;
  final int productId;
  int quantity;

  CartItemModel({
    @required this.id,
    @required this.productId,
    @required this.quantity,
  });
}
