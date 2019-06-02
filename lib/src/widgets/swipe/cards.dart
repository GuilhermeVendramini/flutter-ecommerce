import 'package:flutter/material.dart';

Widget image1 = Container(
  height: 400,
  width: 300,
  decoration: BoxDecoration(
      image: new DecorationImage(
        image: new ExactAssetImage('assets/images/model-1.jpg'),
        fit: BoxFit.cover,
      ),
      //color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(8))),
);
Widget image2 = Container(
  height: 400,
  width: 300,
  decoration: BoxDecoration(
      image: new DecorationImage(
        image: new ExactAssetImage('assets/images/model-2.jpg'),
        fit: BoxFit.cover,
      ),
      //color: Colors.red,
      borderRadius: BorderRadius.all(Radius.circular(8))),
);

Widget image3 = Container(
  height: 400,
  width: 300,
  decoration: BoxDecoration(
      image: new DecorationImage(
        image: new ExactAssetImage('assets/images/model-3.jpg'),
        fit: BoxFit.cover,
      ),
      //color: Colors.green,
      borderRadius: BorderRadius.all(Radius.circular(8))),
);
Widget image4 = Container(
  height: 400,
  width: 300,
  decoration: BoxDecoration(
      image: new DecorationImage(
        image: new ExactAssetImage('assets/images/model-4.jpg'),
        fit: BoxFit.cover,
      ),
      //color: Colors.yellow,
      borderRadius: BorderRadius.all(Radius.circular(8))),
);