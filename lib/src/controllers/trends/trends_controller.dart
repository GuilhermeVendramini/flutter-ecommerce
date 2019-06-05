import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/trends_data.dart';
import 'package:flutter_ecommerce/src/models/trend_model.dart';

class TrendsController with ChangeNotifier {
  List<Map<String, dynamic>> _trendsData;
  List<TrendModel> _trendsItems = [];
  bool _isTrendsLoaded;
}

class Trends extends TrendsController {
  List<TrendModel> get getTrendsItems {
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
      TrendModel _trend = TrendModel(
        title: item['title'],
        image: 'assets/images/${item['image']}',
        brand: item['brand'],
        logo: 'assets/images/${item['logo']}',
        time: item['time'],
        views: item['views'],
        likes: item['likes'],
      );
      _trendsItems.add(_trend);
    });
    _isTrendsLoaded = true;
    return null;
  }

}
