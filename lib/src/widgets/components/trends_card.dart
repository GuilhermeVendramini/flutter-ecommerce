import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/trend_model.dart';
import 'package:flutter_ecommerce/src/screens/trend_screen.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';

class TrendsCard extends StatelessWidget {
  final TrendModel _item;

  TrendsCard(this._item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(
          builder: (context) => TrendScreen(_item.id),
        );
        Navigator.push(context, route);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          side: BorderSide(width: 0.0),
        ),
        margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: _item.logo,
                    child: CommonCircularLogo1(_item.logo),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CommonBrand(_item.brand),
                  Spacer(),
                  commonIconTime(),
                  SizedBox(
                    width: 4.0,
                  ),
                  CommonTime(_item.time),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                CommonStackBackground(_item.image, 300.0),
                Container(
                  padding: EdgeInsets.all(20.0),
                  height: 300.0,
                  decoration: commonStackGradient,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CommonTitle(_item.title),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: CommonInteractivity(
                            _item.views, _item.likes, MainAxisAlignment.start),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
