import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/content/store/home_content.dart';
import 'package:flutter_ecommerce/src/widgets/components/search.dart';
import 'package:flutter_ecommerce/src/widgets/components/side_drawer.dart';

class StoreScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreScreenSate();
  }
}

class _StoreScreenSate extends State<StoreScreen> {
  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: sideDrawer(context),
          appBar: AppBar(
            centerTitle: true,
            title: _showSearch ? searchInput(context) : Text('STORE'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Home',
                ),
                Tab(
                  text: 'Shoes',
                ),
                Tab(
                  text: 'T-Shirts',
                ),
              ],
            ),
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
          body: TabBarView(
            children: <Widget>[
              HomeContent(),
              Text('Shoes'),
              Text('T-Shirts'),
            ],
          ),
        ),
      ),
    );
  }
}
