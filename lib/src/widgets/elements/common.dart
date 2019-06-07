import 'package:flutter/material.dart';

class CommonCircularLogo1 extends StatelessWidget {
  final String _logo;

  CommonCircularLogo1(this._logo);

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

class CommonCircularLogo2 extends StatelessWidget {
  final String _logo;

  CommonCircularLogo2(this._logo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(160.0),
        border: Border.all(color: Colors.white),
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

class CommonBrand extends StatelessWidget {
  final String _brand;

  CommonBrand(this._brand);

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

Widget commonIconTime() {
  return Icon(
    Icons.access_time,
    color: Colors.black26,
    size: 16.0,
  );
}

class CommonTime extends StatelessWidget {
  final String _time;

  CommonTime(this._time);

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

class CommonStackBackground extends StatelessWidget {
  final String _image;
  final double _height;

  CommonStackBackground(this._image, this._height);

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
      height: _height,
    );
  }
}

BoxDecoration commonStackGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black.withOpacity(0.8),
    ],
    stops: [
      0.0,
      1.0,
    ],
  ),
);

class CommonTitle extends StatelessWidget {
  final String _title;

  CommonTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _title,
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}

class CommonInteractivity extends StatelessWidget {
  final String _views;
  final String _likes;
  final MainAxisAlignment _mAlignment;

  CommonInteractivity(this._views, this._likes, this._mAlignment);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: _mAlignment,
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

class CommonTitleContent extends StatelessWidget {
  final String _title;

  CommonTitleContent(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class CommonContentBody extends StatelessWidget {
  final String _body;

  CommonContentBody(this._body);

  @override
  Widget build(BuildContext context) {
    return Text(
      _body,
      style: TextStyle(
        color: Colors.black54,
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}