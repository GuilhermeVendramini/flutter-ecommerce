import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/widgets/components/backgrounds.dart';

class EndScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EndScreenSate();
  }
}

class _EndScreenSate extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                BackgroundImageBlur(),
                Center(
                  child: Container(
                    width: targetWidth,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Spacer(),
                        Icon(
                          Icons.check,
                          size: 200.0,
                          color: Theme.of(context).buttonColor,
                        ),
                        Text(
                          'THAT\'S ALL FOLKS!',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
