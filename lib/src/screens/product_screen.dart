import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/content/product/product_content.dart';
import 'package:flutter_ecommerce/src/controllers/cart/cart_controller.dart';
import 'package:flutter_ecommerce/src/models/product_model.dart';
import 'package:flutter_ecommerce/src/controllers/products/products_controller.dart';
import 'package:flutter_ecommerce/src/widgets/components/cart.dart';
import 'package:flutter_ecommerce/src/widgets/components/product.dart';
import 'package:flutter_ecommerce/src/widgets/components/search.dart';
import 'package:flutter_ecommerce/src/widgets/components/side_drawer.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final int _productId;

  ProductScreen(this._productId);

  @override
  State<StatefulWidget> createState() {
    return _ProductScreenSate(_productId);
  }
}

class _ProductScreenSate extends State<ProductScreen> {
  bool _showSearch = false;
  int _productId;
  bool _reachBottom = false;
  ScrollController _controller;

  _ProductScreenSate(this._productId);

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _reachBottom = true;
      });
    } else {
      setState(() {
        _reachBottom = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductsService>(context);
    final ProductModel _product = _products.getProduct(widget._productId);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        drawer: sideDrawer(context),
        appBar: _appBar(_product.brandName),
        body: ProductContent(_controller, _product),
        floatingActionButton: ProductButtonCard(_product.id, _reachBottom),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _appBar(String brandName) {
    final _cart = Provider.of<CartService>(context);
    final int _cartTotalItems = _cart.getCartTotalItems;
    return AppBar(
      centerTitle: true,
      title: _showSearch ? searchInput(context) : Text(brandName),
      actions: <Widget>[
        IconButton(
          icon: _showSearch ? Icon(Icons.close) : Icon(Icons.search),
          onPressed: () {
            setState(() {
              _showSearch = _showSearch ? false : true;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.tune),
          onPressed: () {},
        ),
        CartHeader(_cartTotalItems),
      ],
    );
  }
}
