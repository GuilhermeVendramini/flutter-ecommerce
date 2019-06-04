import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/trend_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/trends_cards.dart';

class TrendsList extends StatelessWidget {
  final List<TrendModel> _trendsList;

  TrendsList(this._trendsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _trendsList.length,
      itemBuilder: (context, index) {
        return TrendsCard(_trendsList[index]);
      },
    );
  }
}
