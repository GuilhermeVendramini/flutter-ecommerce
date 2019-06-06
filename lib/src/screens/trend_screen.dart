import 'package:flutter/material.dart';

class TrendScreen extends StatefulWidget {
  //final int _trendId;

  //TrendScreen(this._trendId);

  @override
  State<StatefulWidget> createState() {
    return _TrendScreenState();
  }
}

class _TrendScreenState extends State<TrendScreen> {
  @override
  Widget build(BuildContext context) {
    final double topWidgetHeight = 400.0;
    final double avatarRadius = 50.0;
    final backgroundColor = Colors.grey[100];
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
                    Container(
                      padding: EdgeInsets.all(10.0),
                      height: topWidgetHeight,
                      //alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/model-20.jpg',
                          ),
                        ),
                      ),
                      /* child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('2019 SPRING STYLE ddfgd',
                              style: Theme.of(context).textTheme.display1,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.visibility,
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text('11.8k'),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.whatshot,
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text('12k'),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text('Adidas Oficial'),
                            SizedBox(
                              height: 60.0,
                            ),
                          ],
                        ),*/
                    ),
                    Container(
                      height: topWidgetHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                          stops: [
                            0.0,
                            1.0,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'A MODA CHEGOU AGORA',
                            style: Theme.of(context).textTheme.display1,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.visibility,
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text('18.2k'),
                              SizedBox(
                                width: 15.0,
                              ),
                              Icon(
                                Icons.whatshot,
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text('13.2k'),
                            ],
                          ),
                          SizedBox(
                            height: 80.0,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(160.0),
                          border: Border.all(color: Colors.white),
                          image: DecorationImage(
                            image: ExactAssetImage(
                              'assets/images/model-20a.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
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
                        Text(
                          'Lorem ipsum dolor sit amet',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel nisi ut diam congue porttitor id et ante. Praesent cursus a urna ac hendrerit. Nulla efficitur risus mi, id cursus velit tincidunt auctor. Duis at feugiat nulla, eget molestie dolor. Nulla et lorem fermentum, faucibus odio in, laoreet ligula.',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
