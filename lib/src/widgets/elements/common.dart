import 'package:flutter/material.dart';

class CommonCircularLogo extends StatelessWidget {
  final String _logo;
  final double _width;
  final double _height;

  CommonCircularLogo(this._logo, this._width, this._height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
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

class CommonTitleShadow extends StatelessWidget {
  final String _title;

  CommonTitleShadow(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 1.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class CommonTitleOpacity extends StatelessWidget {
  final String _title;

  CommonTitleOpacity(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.center,
    );
  }
}