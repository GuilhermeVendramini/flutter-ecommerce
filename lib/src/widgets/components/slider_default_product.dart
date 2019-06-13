import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_ecommerce/src/screens/product_screen.dart';
import 'package:flutter_ecommerce/src/widgets/elements/common.dart';

class SliderDefaultProduct extends StatefulWidget {
  final List<dynamic> _slider;

  SliderDefaultProduct(this._slider);

  @override
  _SliderDefaultProductState createState() => _SliderDefaultProductState();
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class _SliderDefaultProductState extends State<SliderDefaultProduct> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    if (widget._slider.length > 0) {
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
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      CommonStackBackground(i.image, 400.0),
                      _sliderContent(i),
                    ],
                  );
                },
              );
            }).toList(),
          ),
          _sliderDots(),
        ],
      );
    }

    return Center(
      child: Text('Empty slider'),
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

  Widget _sliderContent(dynamic i) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(
          builder: (context) => ProductScreen(i.productId),
        );
        Navigator.push(context, route);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        height: 400.0,
        decoration: BoxDecoration(gradient: commonLinearGradient),
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
      ),
    );
  }
}
