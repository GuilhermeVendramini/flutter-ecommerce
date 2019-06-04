import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/trends/trends_controller.dart';
import 'package:flutter_ecommerce/src/widgets/components/trends_list.dart';
import 'package:provider/provider.dart';

class TrendsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    final _trends = Provider.of<TrendsService>(context);

    if (_trends.isTrendsLoaded == null) {
      _trends.loadTrends();
    }

    return Center(
      child: Container(
        width: targetWidth,
        child: TrendsList(_trends.getTrendsItems),
      ),
    );
  }
}
