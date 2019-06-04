import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/trends_data.dart';

class TrendsController with ChangeNotifier {
  List<Map<String, dynamic>> _trendsData;
  List<Map<String, dynamic>> _trendsItems = [];
  bool _isTrendsLoaded;
}

class Trends extends TrendsController {
  List<Map<String, dynamic>> get getTrendsItems {
    return _trendsItems;
  }

  bool get isTrendsLoaded {
    return _isTrendsLoaded;
  }
}

class TrendsService extends Trends {
  loadTrends() {
    if (_isTrendsLoaded != null) {
      return null;
    }

    _trendsItems = [];
    _trendsData = trendsData;
    _trendsData.forEach((item) {
      _trendsItems.add(item);
    });
    _isTrendsLoaded = true;
    return null;
  }

}
