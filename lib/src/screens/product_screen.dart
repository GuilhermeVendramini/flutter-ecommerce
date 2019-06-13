import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/content/product/product_content.dart';
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

  _ProductScreenSate(this._productId);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        drawer: sideDrawer(context),
        appBar: AppBar(
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
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
              },
            ),
          ],
        ),
        body: ProductContent(),
      ),
    );
  }
}
