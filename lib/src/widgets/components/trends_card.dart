import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/trend_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/base_card.dart';

class TrendsCard extends StatelessWidget {
  final TrendModel _item;

  TrendsCard(this._item);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                CardLogo(_item.logo),
                SizedBox(
                  width: 20.0,
                ),
                CardBrand(_item.brand),
                Spacer(),
                cardIconTime(),
                SizedBox(
                  width: 4.0,
                ),
                CardTime(_item.time),
              ],
            ),
          ),
          Stack(children: <Widget>[
            CardStackBackground(_item.image),
            Container(
              height: 300.0,
              decoration: cardStackGradient,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CardTitle(_item.title),
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                    child: CardInteractivity(_item.views, _item.likes),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
