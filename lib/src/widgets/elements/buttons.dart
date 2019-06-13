import 'package:flutter/material.dart';
import 'dart:ui';

class ButtonLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        onPressed: () => {
              Navigator.pushReplacementNamed(context, '/login'),
            },
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () => {
              Navigator.pushReplacementNamed(context, '/swipe'),
            },
      ),
    );
  }
}

class ButtonRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        onPressed: () => {
              Navigator.pushReplacementNamed(context, '/'),
            },
      ),
    );
  }
}

class ButtonRegisterSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        onPressed: () => {
              Navigator.pushReplacementNamed(context, '/register'),
            },
      ),
    );
  }
}
