import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/feeds/feeds_controller.dart';
import 'package:flutter_ecommerce/src/widgets/components/feeds_list.dart';
import 'package:provider/provider.dart';

class FeedsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    final _feeds = Provider.of<FeedsService>(context);

    if (_feeds.isFeedsLoaded == null) {
      _feeds.loadFeeds();
    }

    return Center(
      child: Container(
        width: targetWidth,
        child: FeedsList(_feeds.getTrendsItems),
      ),
    );
  }
}
