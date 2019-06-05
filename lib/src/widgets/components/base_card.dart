import 'package:flutter/material.dart';

class CardLogo extends StatelessWidget {
  final String _logo;

  CardLogo(this._logo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(160.0),
        image: DecorationImage(
          image: ExactAssetImage(
            _logo,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CardBrand extends StatelessWidget {
  final String _brand;

  CardBrand(this._brand);

  @override
  Widget build(BuildContext context) {
    return Text(
      _brand,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

Widget cardIconTime() {
  return Icon(
    Icons.access_time,
    color: Colors.black26,
    size: 16.0,
  );
}

class CardTime extends StatelessWidget {
  final String _time;

  CardTime(this._time);

  @override
  Widget build(BuildContext context) {
    return Text(
      _time,
      style: TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CardStackBackground extends StatelessWidget {
  final String _image;

  CardStackBackground(this._image);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            _image,
          ),
        ),
      ),
      height: 300.0,
    );
  }
}

BoxDecoration cardStackGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black.withOpacity(0.5),
    ],
    stops: [
      0.0,
      1.0,
    ],
  ),
);

class CardTitle extends StatelessWidget {
  final String _title;

  CardTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.bottomLeft,
      child: Text(
        _title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CardInteractivity extends StatelessWidget {
  final String _views;
  final String _likes;

  CardInteractivity(this._views, this._likes);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.visibility,
          size: 20.0,
        ),
        SizedBox(
          width: 2.0,
        ),
        Text(_views),
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
        Text(_likes),
      ],
    );
  }
}
