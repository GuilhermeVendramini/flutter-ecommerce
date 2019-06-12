import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/products/products_controller.dart';
import 'package:flutter_ecommerce/src/controllers/sales/sales_controller.dart';
import 'package:flutter_ecommerce/src/widgets/components/products_list.dart';
import 'package:flutter_ecommerce/src/widgets/components/slider_card.dart';
import 'package:flutter_ecommerce/src/widgets/components/slider_default.dart';
import 'package:provider/provider.dart';

class StoreHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _sales = Provider.of<SalesService>(context);
    final _products = Provider.of<ProductsService>(context);

    if (_sales.isSalesLoaded == null) {
      _sales.loadSales();
    }

    if (_products.isProductsLoaded == null) {
      _products.loadProducts();
    }

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SliderDefault(_sales.getSalesItems.getRange(0, 3).toList()),
            ProductsList(_products.getProductsItems.getRange(0, 2).toList()),
            SizedBox(
              height: 20.0,
            ),
            _salesOfTheWeek(_sales),
            SizedBox(
              height: 20.0,
            ),
            ProductsList(_products.getProductsItems.getRange(2, 4).toList()),
          ],
        ),
      ),
    );
  }

  Widget _salesOfTheWeek(SalesService _sales) {
    return Container(
      padding: EdgeInsets.all(24.0),
      color: Colors.black87,
      child: Column(
        children: <Widget>[
          Text(
            'SALES OF THE WEEK',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SliderCard(_sales.getSalesItems.getRange(2, 5).toList()),
        ],
      ),
    );
  }
}
