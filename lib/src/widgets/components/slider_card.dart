import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';

class SliderCard extends StatefulWidget {
  final List<dynamic> _slider;

  SliderCard(this._slider);

  @override
  _SliderCardState createState() => _SliderCardState();
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class _SliderCardState extends State<SliderCard> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          height: 400,
          autoPlayCurve: Curves.fastOutSlowIn,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          enlargeCenterPage: true,
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
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      _sliderImage(i),
                      _sliderContent(i),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        _sliderDots(),
      ],
    );
  }

  Widget _sliderDots() {
    return Row(
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
    );
  }

  Widget _sliderImage(dynamic i) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            i.image,
          ),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      height: 400,
    );
  }

  Widget _sliderContent(dynamic i) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 400.0,
      decoration: _sliderBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          CommonTitleShadow(i.title.toUpperCase()),
          SizedBox(
            height: 20.0,
          ),
          CommonDescription(i.description),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  BoxDecoration _sliderBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    gradient: commonLinearGradient,
  );
}
