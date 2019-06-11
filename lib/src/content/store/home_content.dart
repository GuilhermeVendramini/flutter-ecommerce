import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/sales/sales_controller.dart';
import 'package:flutter_ecommerce/src/widgets/components/slider_default.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    final _sales = Provider.of<SalesService>(context);

    if (_sales.isSalesLoaded == null) {
      _sales.loadSales();
    }

    return SingleChildScrollView(
      child: Container(
        //width: targetWidth,
        child: Column(
          children: <Widget>[
            SliderDefault(_sales.getSalesItems),
            SizedBox(
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
