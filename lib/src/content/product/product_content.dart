import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/sales/sales_controller.dart';
import 'package:flutter_ecommerce/src/widgets/components/slider_card.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';
import 'package:flutter_ecommerce/src/widgets/elements/product.dart';
import 'package:provider/provider.dart';

class ProductContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _sales = Provider.of<SalesService>(context);

    if (_sales.isSalesLoaded == null) {
      _sales.loadSales();
    }

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            SliderCard(_sales.getSalesItems.getRange(2, 5).toList()),
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
          CommonTitleContent('Uniform Ware 104'),
          SizedBox(
            height: 20.0,
          ),
          CommonContentBody(
              'Proin convallis ligula sed diam hendrerit, eget consectetur nibh facilisis.'),
          SizedBox(
            height: 20.0,
          ),
          CommonSubTitleContent('SPECIFICATION'),
          SizedBox(
            height: 10.0,
          ),
          CommonContentHtmlBody(
              """<b>Lorem:</b> ipsum dolor sit amet. <br><b>Proin:</b> convallis.<br><b>Quisque:</b> interdum venenatis.<br><b>Cras vitae:</b> ipsum mauris."""),
          _productVariations(),
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
              CommonSubTitleContent('COLOR'),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 200,
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: <Widget>[
                    ProductCircularColor(Colors.red[200]),
                    ProductCircularColor(Colors.blue[200]),
                    ProductCircularColor(Colors.green[200]),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonTitleContent('PRICE'),
              SizedBox(
                height: 4.0,
              ),
              _productPrice(100.00),
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
