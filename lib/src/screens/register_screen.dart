import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/widgets/components/backgrounds.dart';
import 'package:flutter_ecommerce/src/widgets/elements/buttons.dart';
import 'package:flutter_ecommerce/src/widgets/elements/inputs.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenSate();
  }
}

class _RegisterScreenSate extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/');
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
                                      'Create an account',
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                    Spacer(),
                                    InputLogin(),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    InputPassword(),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    InputConfirmPassword(),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    InputEmail(),
                                    Spacer(),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    ButtonRegister(),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                        'By creating an account you agree to our'),
                                    Text('User Agreement and Privacy policy.'),
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
