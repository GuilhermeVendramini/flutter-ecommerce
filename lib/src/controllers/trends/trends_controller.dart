import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/trends_data.dart';
import 'package:flutter_ecommerce/src/models/trend_model.dart';

class TrendsController with ChangeNotifier {
  List<Map<String, dynamic>> _trendsData;
  List<TrendModel> _trends = [];
  Iterable<TrendModel> _trend;
  bool _isTrendsLoaded;
}

class Trends extends TrendsController {
  List<TrendModel> get getTrendsItems {
    return _trends;
  }

  TrendModel getTrend(int id) {
    _trend = _trends.where((trend) => trend.id == id);
    return _trend.first;
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

    _trends = [];
    _trendsData = trendsData;
    _trendsData.forEach((item) {
      TrendModel _trend = TrendModel(
        id: item['id'],
        title: item['title'],
        image: 'assets/images/${item['image']}',
        brand: item['brand'],
        logo: 'assets/images/${item['logo']}',
        time: item['time'],
        views: item['views'],
        likes: item['likes'],
        subtitle: item['subtitle'],
        content: item['content'],
      );
      _trends.add(_trend);
    });
    _isTrendsLoaded = true;
    return null;
  }
}
