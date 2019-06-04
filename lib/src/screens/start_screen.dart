import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/widgets/components/app.dart';
import 'package:flutter_ecommerce/src/widgets/components/backgrounds.dart';
import 'package:flutter_ecommerce/src/widgets/elements/buttons.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StartScreenSate();
  }
}

class _StartScreenSate extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    return Scaffold(
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
                                SizedBox(
                                  height: 40.0,
                                ),
                                Spacer(),
                                AppName(),
                                SizedBox(
                                  height: 20.0,
                                ),
                                AppSlogan(),
                                Spacer(
                                  flex: 2,
                                ),
                                ButtonLoginScreen(),
                                SizedBox(
                                  height: 20.0,
                                ),
                                ButtonRegisterSreen(),
                                Spacer(),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
