import 'package:flutter/material.dart';
import 'dart:ui';

class BackgroundImageBlur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: _backgroundImage(),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }

  DecorationImage _backgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstIn),
      image: AssetImage('assets/images/model-0.jpg'),
    );
  }
}
