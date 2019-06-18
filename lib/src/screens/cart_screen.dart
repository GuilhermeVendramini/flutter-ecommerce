import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/cart/cart_controller.dart';
import 'package:flutter_ecommerce/src/controllers/products/products_controller.dart';
import 'package:flutter_ecommerce/src/models/cart_item_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/side_drawer.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartScreenSate();
  }
}

class _CartScreenSate extends State<CartScreen> {
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
        body: _listCartItems(),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text('CART'),
    );
  }

  Widget _listCartItems() {
    final _cart = Provider.of<CartService>(context);
    final List<CartItemModel> _cartItems = _cart.getCartItems;
    return ListView.builder(
      itemCount: _cartItems.length,
      itemBuilder: (context, index) {
        return _cartItem(_cartItems[index]);
      },
    );
  }

  Widget _cartItem(CartItemModel cartItem) {
    final _cart = Provider.of<CartService>(context);
    final _products = Provider.of<ProductsService>(context);
    final _product = _products.getProduct(cartItem.productId);
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200])),
        ),
        width: targetWidth,
        padding:
            EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              width: 120.0,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(_product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Wrap(
                direction: Axis.vertical,
                children: <Widget>[
                  CommonSubTitleContent(_product.title),
                  CommonContentBody(_product.brandName),
                  SizedBox(
                    height: 10.0,
                  ),
                  CommonSubTitleContent("\$${_product.price}"),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[400]),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Wrap(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  _cart.addItemCard(cartItem.productId, 1);
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.grey[800],
                                  size: 30.0,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              CommonContentBody("${cartItem.quantity}"),
                              SizedBox(
                                width: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _cart.removeQuantityItemCard(
                                      cartItem.productId);
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.grey[800],
                                  size: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            _cart.removeItemCard(cartItem.id);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.grey[800],
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
