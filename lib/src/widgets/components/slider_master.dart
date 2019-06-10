import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderMaster extends StatefulWidget {
  final List<Map<String, String>> _slider;

  SliderMaster(this._slider);

  @override
  _SliderMasterState createState() => _SliderMasterState();
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class _SliderMasterState extends State<SliderMaster> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          height: 400,
          autoPlayCurve: Curves.fastOutSlowIn,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          pauseAutoPlayOnTouch: Duration(seconds: 6),
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          items: widget._slider.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  //margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: ExactAssetImage(i['item']),
                      fit: BoxFit.cover,
                    ),
                    //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(
            widget._slider,
                (index, url) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
            },
          ),
        ),
      ],
    );
  }
}
