import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/swipe_data.dart';
import 'package:flutter_ecommerce/src/models/swipe_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/swipe_card.dart';

class SwipeController with ChangeNotifier {
  List<Map<String, dynamic>> _swipeData;
  List<SwipeCard> _swipeCards = [];
  bool _isSwipeLoaded;
}

class Swipe extends SwipeController {
  List<SwipeCard> get getSwipeCards {
    return _swipeCards;
  }

  bool get isSwipeLoaded {
    return _isSwipeLoaded;
  }
}

class SwipeService extends Swipe {
  loadSwipe() {
    if (_isSwipeLoaded != null) {
      return null;
    }

    _swipeCards = [];
    _swipeData = swipeData;
    _swipeData.forEach((item) {
      SwipeModel _swipe = SwipeModel(
          title: item['title'], image: 'assets/images/${item['image']}');
      _swipeCards.add(SwipeCard(_swipe));
    });
    _isSwipeLoaded = true;
    return null;
  }
}
