import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/content/store/store_brand_content.dart';
import 'package:flutter_ecommerce/src/widgets/components/search.dart';
import 'package:flutter_ecommerce/src/widgets/components/side_drawer.dart';

class StoreBrandScreen extends StatefulWidget {
  final int _id;

  StoreBrandScreen(this._id);

  @override
  State<StatefulWidget> createState() {
    return _StoreBrandScreenSate(_id);
  }
}

class _StoreBrandScreenSate extends State<StoreBrandScreen> {
  bool _showSearch = false;
  int _brandId;

  _StoreBrandScreenSate(this._brandId);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
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
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
        body: StoreBrandContent(_brandId),
      ),
    );
  }
}
