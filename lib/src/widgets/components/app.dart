import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class AppSlogan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Fashion. Fresh. For everyone.',
      ),
    );
  }
}
