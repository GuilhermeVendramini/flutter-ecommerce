import 'package:flutter/material.dart';

class Followers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FollowersSate();
  }
}

class _FollowersSate extends State<Followers> {
  bool _followingStatus = true;
  String _followingText = 'FOLLOWING';
  Color _buttonColor = ThemeData.dark().buttonColor;

  void _toggleFollowers() {
    setState(() {
      if (_followingStatus) {
        _followingStatus = false;
        _followingText = 'FOLLOW';
        _buttonColor = Colors.transparent;
      } else {
        _followingStatus = true;
        _followingText = 'FOLLOWING';
        _buttonColor = ThemeData.dark().buttonColor;
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 150.0,
      child: RaisedButton(
        child: Text(
          _followingText,
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.white.withOpacity(0.6)),
        ),
        onPressed: _toggleFollowers,
        color: _buttonColor,
      ),
    );
  }
}
