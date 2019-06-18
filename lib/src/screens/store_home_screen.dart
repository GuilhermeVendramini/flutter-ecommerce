import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/content/store/store_home_content.dart';
import 'package:flutter_ecommerce/src/controllers/cart/cart_controller.dart';
import 'package:flutter_ecommerce/src/widgets/components/cart.dart';
import 'package:flutter_ecommerce/src/widgets/components/search.dart';
import 'package:flutter_ecommerce/src/widgets/components/side_drawer.dart';
import 'package:provider/provider.dart';

class StoreHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreHomeScreenSate();
  }
}

class _StoreHomeScreenSate extends State<StoreHomeScreen> {
  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: sideDrawer(context),
        appBar: _appBar(),
        body: StoreHomeContent(),
      ),
    );
  }

  Widget _appBar() {
    final _cart = Provider.of<CartService>(context);
    final int _cartTotalItems = _cart.getCartTotalItems;
    return AppBar(
      centerTitle: true,
      title: _showSearch ? searchInput(context) : Text('STORE'),
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
