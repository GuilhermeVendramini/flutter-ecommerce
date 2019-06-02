import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/swipe_data.dart';
import 'package:flutter_ecommerce/src/widgets/components/swipe_cards.dart';

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

    _swipeData = swipeData;
    _swipeData.forEach((item) {
      _swipeCards.add(SwipeCard(item));
    });
    return null;
  }
}
