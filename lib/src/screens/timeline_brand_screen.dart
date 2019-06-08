import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/posts_brand/posts_brand_controller.dart';
import 'package:flutter_ecommerce/src/models/post_brand_model.dart';
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
    final _posts = Provider.of<PostsBrandService>(context);
    final PostBrandModel _post = _posts.getPostBrand(widget._id);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
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
                          CommonCircularLogo('assets/images/timberland.png', 100.0, 100.0),
                          SizedBox(
                            height: 30.0,
                          ),
                          CommonTitle('TIMBERLAND'),
                          SizedBox(
                            height: 20.0,
                          ),
                          CommonTitleOpacity('TIMBERLAND BOOTS, SHOES & CLOTHING OFFICAL COMMUNITY'),
                          SizedBox(
                            height: 30.0,
                          ),
                          CommonTitleOpacity('165k followers'),
                          SizedBox(
                            height: 20.0,
                          ),
                          _following(),
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
                Text('BBB'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _following() {
    return Container(
      height: 50.0,
      width: 150.0,
      child: RaisedButton(
        child: CommonTitleOpacity('FOLLOWING'),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () => {},
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/blur.jpg'),
        colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.hardLight
        ),
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
