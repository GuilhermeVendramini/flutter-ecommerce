import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/products/products_controller.dart';
import 'package:flutter_ecommerce/src/controllers/sales/sales_controller.dart';
import 'package:flutter_ecommerce/src/screens/store_home_screen.dart';
import 'package:flutter_ecommerce/src/widgets/components/products_list.dart';
import 'package:flutter_ecommerce/src/widgets/components/slider_default.dart';
import 'package:provider/provider.dart';

class StoreBrandContent extends StatelessWidget {
  final int _brandId;

  StoreBrandContent(this._brandId);

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
            SliderDefault(_sales.getSalesItems
                .where((brand) => brand.brandId == _brandId)
                .toList()),
            ProductsList(_products.getProductsItems
                .where((brand) => brand.brandId == _brandId)
                .toList()),
            SizedBox(
              height: 20.0,
            ),
            _goToHomeStore(context),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _goToHomeStore(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(
          builder: (context) => StoreHomeScreen(),
        );
        Navigator.push(context, route);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black87),
            borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          'GO TO HOME STORE',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
