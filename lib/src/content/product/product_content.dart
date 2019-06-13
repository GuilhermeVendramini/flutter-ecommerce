import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/product_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/slider_card.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';
import 'package:flutter_ecommerce/src/widgets/elements/product.dart';

class ProductContent extends StatelessWidget {
  final ScrollController _controller;
  final ProductModel _product;

  ProductContent(this._controller, this._product);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      controller: _controller,
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            SliderCard(_product.gallery.toList()),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: _productDetails(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productDetails(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    return Container(
      width: targetWidth,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonTitleContent(_product.title),
          SizedBox(
            height: 20.0,
          ),
          CommonContentBody(_product.description),
          SizedBox(
            height: 20.0,
          ),
          CommonSubTitleContent('Specification'),
          SizedBox(
            height: 10.0,
          ),
          CommonContentHtmlBody(_product.specification),
          _productVariations(),
          SizedBox(
            height: 80.0,
          ),
        ],
      ),
    );
  }

  Widget _productVariations() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[100])),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonSubTitleContent('Color'),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 200,
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: <Widget>[
                    ProductCircularColor(Colors.brown.shade900),
                    ProductCircularColor(Colors.grey.shade900),
                    ProductCircularColor(Colors.deepPurple.shade900),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonTitleContent('Price'),
              SizedBox(
                height: 4.0,
              ),
              _productPrice(_product.price),
            ],
          ),
        ],
      ),
    );
  }

  Widget _productPrice(double _price) {
    return Text(
      '\$$_price',
      style: TextStyle(
        color: Colors.black87,
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
