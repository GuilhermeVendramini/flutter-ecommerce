import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/post_brand_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/post_brand_card.dart';

class TrendsList extends StatelessWidget {
  final List<PostBrandModel> _trendsList;

  TrendsList(this._trendsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _trendsList.length,
      itemBuilder: (context, index) {
        return PostBrandCard(_trendsList[index]);
      },
    );
  }
}
