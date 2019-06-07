import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/posts_brand/posts_brand_controller.dart';
import 'package:flutter_ecommerce/src/widgets/components/trends_list.dart';
import 'package:provider/provider.dart';

class TrendsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    final _trends = Provider.of<PostsBrandService>(context);

    if (_trends.isPostsBrandLoaded == null) {
      _trends.loadPostsBrand();
    }

    return Center(
      child: Container(
        width: targetWidth,
        child: TrendsList(_trends.getPostsBrandItems),
      ),
    );
  }
}
