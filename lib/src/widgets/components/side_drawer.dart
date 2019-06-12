import 'package:flutter/material.dart';

Widget sideDrawer(BuildContext context) {
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(160.0),
              image: DecorationImage(
                image: ExactAssetImage(
                  'assets/images/model-10.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Carol Vendramini',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/explore');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(
              'Store',
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/store');
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text(
              'Orders',
            ),
          ),
          ListTile(
            leading: Icon(Icons.star_border),
            title: Text(
              'Wishlist',
            ),
          ),
          ListTile(
            leading: Icon(Icons.explore),
            title: Text(
              'Explore',
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/explore');
            },
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            height: 10.0,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    ),
  );
}
