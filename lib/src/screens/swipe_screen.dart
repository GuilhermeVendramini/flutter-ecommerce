import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/widgets/components/backgrounds.dart';

class SwipeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwipeScreenSate();
  }
}

class _SwipeScreenSate extends State<SwipeScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/login');
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
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                          child: IntrinsicHeight(
                            child: Form(
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Spacer(),
                                    Text(
                                      'Choose interested',
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                    Text(
                                      'themes',
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                    Spacer(),
                                  ]),
                            ),
                          )),
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
