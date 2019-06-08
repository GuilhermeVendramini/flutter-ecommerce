import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/posts_blogger/posts_blogger_controller.dart';
import 'package:flutter_ecommerce/src/widgets/components/feeds_list.dart';
import 'package:provider/provider.dart';

class FeedsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    final _feeds = Provider.of<PostsBloggerService>(context);

    if (_feeds.isPostsBloggerLoaded == null) {
      _feeds.loadPostsBlogger();
    }

    return Center(
      child: Container(
        width: targetWidth,
        child: FeedsList(_feeds.getPostsBlogger),
      ),
    );
  }
}
