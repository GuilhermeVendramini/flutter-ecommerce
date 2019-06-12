import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/content/store/store_home_content.dart';
import 'package:flutter_ecommerce/src/widgets/components/search.dart';
import 'package:flutter_ecommerce/src/widgets/components/side_drawer.dart';

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
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: sideDrawer(context),
        appBar: AppBar(
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
        body: StoreHomeContent(),
      ),
    );
  }
}
