import 'dart:ui';

import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _backgroundImageBlur(),
            Center(
              child: Container(
                width: targetWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _appName(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _appSlogan(),
                      SizedBox(
                        height: 180.0,
                      ),
                      _buttonLogin(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'or',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buttonRegister(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _appName() {
    return Container(
      child: Text(
        'STYLE',
        style: TextStyle(
          fontSize: 68.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container _appSlogan() {
    return Container(
      child: Text(
        'Fashion. Fresh. For everyone.',
      ),
    );
  }

  Container _buttonLogin() {
    return Container(
      height: 50.0,
      width: 300.0,
      child: RaisedButton(
        child: Text(
          'LOGIN',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () => {},
      ),
    );
  }

  Container _buttonRegister() {
    return Container(
      height: 50.0,
      width: 300.0,
      child: RaisedButton(
        child: Text(
          'CREATE AN ACCOUNT',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.white),
        ),
        onPressed: () => {},
      ),
    );
  }

  Container _backgroundImageBlur() {
    return Container(
      decoration: BoxDecoration(
        image: _backgroundImage(),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }

  DecorationImage _backgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstIn),
      image: AssetImage('assets/images/model-0.jpg'),
    );
  }
}
