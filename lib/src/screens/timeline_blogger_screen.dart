import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/authors/authors_controller.dart';
import 'package:flutter_ecommerce/src/controllers/posts_blogger/posts_blogger_controller.dart';
import 'package:flutter_ecommerce/src/models/author_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/followers.dart';
import 'package:flutter_ecommerce/src/widgets/components/timeline_blogger_list.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';
import 'package:provider/provider.dart';

class TimeLineBloggerScreen extends StatefulWidget {
  final int _id;

  TimeLineBloggerScreen(this._id);

  @override
  State<StatefulWidget> createState() {
    return _TimeLineBloggerState();
  }
}

class _TimeLineBloggerState extends State<TimeLineBloggerScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    final _posts = Provider.of<PostsBloggerService>(context);
    final _authors = Provider.of<AuthorsService>(context);
    AuthorModel _author = _authors.getAuthor(widget._id);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        alignment: Alignment.center,
                        height: 500.0,
                        decoration: _boxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Spacer(
                              flex: 4,
                            ),
                            CommonCircularLogo(
                              _author.logo,
                              140.0,
                              140.0,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            CommonTitle(_author.name),
                            SizedBox(
                              height: 20.0,
                            ),
                            CommonTitleOpacity(_author.slogan),
                            SizedBox(
                              height: 30.0,
                            ),
                            CommonTitleOpacity(
                                '${_author.followers} followers'),
                            SizedBox(
                              height: 20.0,
                            ),
                            Followers(),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: targetWidth,
                      child: TimelineBloggerList(
                          _posts.getPostsOfAuthor(widget._id)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/blur.jpg'),
        colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4), BlendMode.hardLight),
      ),
    );
  }
}
