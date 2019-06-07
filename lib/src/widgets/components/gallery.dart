import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Gallery extends StatelessWidget {
  final List<Map<String, String>> _gallery;

  Gallery(this._gallery);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: 400,
      autoPlayCurve: Curves.fastOutSlowIn,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: _gallery.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: ExactAssetImage(i['item']),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
