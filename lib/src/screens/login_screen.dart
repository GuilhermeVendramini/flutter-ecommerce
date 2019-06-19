import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/widgets/components/backgrounds.dart';
import 'package:flutter_ecommerce/src/widgets/elements/buttons.dart';
import 'package:flutter_ecommerce/src/widgets/elements/inputs.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenSate();
  }
}

class _LoginScreenSate extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/');
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
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
                                  Text(
                                    'Welcome back!',
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  Spacer(),
                                  InputLogin(),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  InputPassword(),
                                  Spacer(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  ButtonLogin(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('Forgot password?'),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
