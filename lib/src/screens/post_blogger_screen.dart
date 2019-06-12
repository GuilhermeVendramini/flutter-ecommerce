import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/posts_blogger/posts_blogger_controller.dart';
import 'package:flutter_ecommerce/src/models/post_blogger_model.dart';
import 'package:flutter_ecommerce/src/screens/timeline_blogger_screen.dart';
import 'package:flutter_ecommerce/src/widgets/components/gallery.dart';
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
    final _posts = Provider.of<PostsBloggerService>(context);
    final PostBloggerModel _post = _posts.getPostBlogger(widget._id);

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
                      _post.image,
                      topWidgetHeight,
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      height: topWidgetHeight,
                      decoration: BoxDecoration(gradient: commonLinearGradient),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CommonTitle(_post.title),
                          SizedBox(
                            height: 20.0,
                          ),
                          CommonInteractivity(
                              _post.views, _post.likes, MainAxisAlignment.center),
                          SizedBox(
                            height: 60.0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: GestureDetector(
                        onTap: () {
                          Route route = MaterialPageRoute(
                            builder: (context) => TimeLineBloggerScreen(_post.authorId),
                          );
                          Navigator.push(context, route);
                        },
                        child: CommonCircularLogo(_post.logo, 100.0, 100.0),
                      ),
                      left: (MediaQuery.of(context).size.width / 2) -
                          avatarRadius,
                      top: topWidgetHeight - avatarRadius,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                      builder: (context) => TimeLineBloggerScreen(_post.authorId),
                    );
                    Navigator.push(context, route);
                  },
                  child: Container(
                    width: 100.0,
                    height: 60.0,
                    color: Colors.transparent,
                  ),
                ),
                Container(
                  color: backgroundColor,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      CommonTitleContent(_post.subtitle),
                      SizedBox(
                        height: 20.0,
                      ),
                      CommonContentBody(_post.content),
                      SizedBox(
                        height: 20.0,
                      ),
                      Gallery(_post.gallery),
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
