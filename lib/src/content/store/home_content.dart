import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/widgets/components/slider_master.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 650.0 ? 600.0 : deviceWidth * 0.95;

    List<Map<String, String>> gallery =  [
      {'item': 'assets/images/model-18.jpg'},
      {'item': 'assets/images/model-20.jpg'},
      {'item': 'assets/images/model-16.jpg'},
      {'item': 'assets/images/model-17.jpg'},
    ];

    return SingleChildScrollView(
        child: Container(
          //width: targetWidth,
          child: Column(
            children: <Widget>[
              SliderMaster(gallery),
              SizedBox(
                height: 200.0,
              ),
            ],
          ),
        ),
      );
  }
}
