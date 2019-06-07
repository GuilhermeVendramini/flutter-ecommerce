import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/posts_brand/posts_brand_controller.dart';
import 'package:flutter_ecommerce/src/models/post_brand_model.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';
import 'package:provider/provider.dart';

class PostBrandScreen extends StatefulWidget {
  final int _id;

  PostBrandScreen(this._id);

  @override
  State<StatefulWidget> createState() {
    return _PostBrandScreenState();
  }
}

class _PostBrandScreenState extends State<PostBrandScreen> {
  @override
  Widget build(BuildContext context) {
    final double topWidgetHeight = 400.0;
    final double avatarRadius = 50.0;
    final backgroundColor = Colors.grey[100];
    final _trends = Provider.of<PostsBrandService>(context);
    final PostBrandModel _trend = _trends.getPostBrand(widget._id);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    CommonStackBackground(
                      _trend.image,
                      topWidgetHeight,
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      height: topWidgetHeight,
                      decoration: commonStackGradient,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CommonTitle(_trend.title),
                          SizedBox(
                            height: 20.0,
                          ),
                          CommonInteractivity(_trend.views, _trend.likes,
                              MainAxisAlignment.center),
                          SizedBox(
                            height: 60.0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Hero(
                        tag: _trend.logo,
                        child: CommonCircularLogo2(_trend.logo),
                      ),
                      left: (MediaQuery.of(context).size.width / 2) -
                          avatarRadius,
                      top: topWidgetHeight - avatarRadius,
                    ),
                    SizedBox(
                      height: 120.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                Container(
                  color: backgroundColor,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      CommonTitleContent(_trend.subtitle),
                      SizedBox(
                        height: 20.0,
                      ),
                      CommonContentBody(_trend.content),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
