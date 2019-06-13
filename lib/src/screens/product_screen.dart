import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/content/product/product_content.dart';
import 'package:flutter_ecommerce/src/widgets/components/product.dart';
import 'package:flutter_ecommerce/src/widgets/components/search.dart';
import 'package:flutter_ecommerce/src/widgets/components/side_drawer.dart';

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

  _ProductScreenSate(this._productId);

  ScrollController _controller;

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
    final Color _white = Colors.white;
    final Color _themeBlue = Theme.of(context).buttonColor;

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        drawer: sideDrawer(context),
        appBar: _appBar(),
        body: ProductContent(_controller),
        floatingActionButton:
            ProductButtonCard(_reachBottom, _white, _themeBlue),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      centerTitle: true,
      title: _showSearch ? searchInput(context) : Text('PRODUCT'),
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
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ],
    );
  }
}
