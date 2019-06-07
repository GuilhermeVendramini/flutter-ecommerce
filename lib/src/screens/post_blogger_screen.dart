import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/posts_blogger/posts_blogger_controller.dart';
import 'package:flutter_ecommerce/src/models/post_blogger_model.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';
import 'package:provider/provider.dart';

class PostBloggerScreen extends StatefulWidget {
  final int _id;

  PostBloggerScreen(this._id);

  @override
  State<StatefulWidget> createState() {
    return _PostBloggerScreenState();
  }
}

class _PostBloggerScreenState extends State<PostBloggerScreen> {
  @override
  Widget build(BuildContext context) {
    final double topWidgetHeight = 400.0;
    final double avatarRadius = 50.0;
    final backgroundColor = Colors.grey[100];
    final _feeds = Provider.of<PostsBloggerService>(context);
    final PostBloggerModel _feed = _feeds.getPostBlogger(widget._id);

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
                      _feed.image,
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
                          CommonTitle(_feed.title),
                          SizedBox(
                            height: 20.0,
                          ),
                          CommonInteractivity(
                              _feed.views, _feed.likes, MainAxisAlignment.center),
                          SizedBox(
                            height: 60.0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Hero(
                        tag: _feed.logo,
                        child: CommonCircularLogo2(_feed.logo),
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
                      CommonTitleContent(_feed.subtitle),
                      SizedBox(
                        height: 20.0,
                      ),
                      CommonContentBody(_feed.content),
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
