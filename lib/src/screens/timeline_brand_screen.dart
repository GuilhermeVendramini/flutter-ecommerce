import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/brands/brands_controller.dart';
import 'package:flutter_ecommerce/src/controllers/posts_brand/posts_brand_controller.dart';
import 'package:flutter_ecommerce/src/models/brand_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/followers.dart';
import 'package:flutter_ecommerce/src/widgets/components/timeline_list.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';
import 'package:provider/provider.dart';

class TimeLineBrandScreen extends StatefulWidget {
  final int _id;

  TimeLineBrandScreen(this._id);

  @override
  State<StatefulWidget> createState() {
    return _TimeLineBrandScreenState();
  }
}

class _TimeLineBrandScreenState extends State<TimeLineBrandScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    final _posts = Provider.of<PostsBrandService>(context);
    final _brands = Provider.of<BrandsService>(context);
    BrandModel _brand = _brands.getBrand(widget._id);

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
                            Hero(
                              tag: _brand.logo,
                              child: CommonCircularLogo(
                                _brand.logo,
                                100.0,
                                100.0,
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            CommonTitle(_brand.title),
                            SizedBox(
                              height: 20.0,
                            ),
                            CommonTitleOpacity(_brand.slogan),
                            SizedBox(
                              height: 30.0,
                            ),
                            CommonTitleOpacity('${_brand.followers} followers'),
                            SizedBox(
                              height: 20.0,
                            ),
                            Followers(),
                            SizedBox(
                              height: 30.0,
                            ),
                            _seeInStore(),
                            Spacer(
                              flex: 1,
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
                      child: TimelineList(_posts.getPostsOfBrand(widget._id)),
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

  Row _seeInStore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'SEE IN STORE',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          width: 6.0,
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.white.withOpacity(0.6),
          size: 18.0,
        ),
      ],
    );
  }
}
