import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/product_model.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';

class ProductCard extends StatelessWidget {
  final ProductModel _item;

  ProductCard(this._item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
/*        Route route = MaterialPageRoute(
          builder: (context) => PostBrandScreen(_item.id),
        );
        Navigator.push(context, route);*/
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    _item.image,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              height: 400.0,
              decoration: BoxDecoration(
                gradient: commonLinearGradient,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CommonTitle(_item.title),
                  SizedBox(
                    height: 20.0,
                  ),
                  CommonDescription(_item.description),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '\$${_item.price}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(20.0),
              child: CommonCircularLogo(_item.logo, 40.0, 40.0),
            ),
          ],
        ),
      ),
    );
  }
}
