import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/feeds_data.dart';
import 'package:flutter_ecommerce/src/models/feed_model.dart';

class FeedsController with ChangeNotifier {
  List<Map<String, dynamic>> _feedsData;
  List<FeedModel> _feedsItems = [];
  bool _isFeedsLoaded;
}

class Feeds extends FeedsController {
  List<FeedModel> get getTrendsItems {
    return _feedsItems;
  }

  bool get isFeedsLoaded {
    return _isFeedsLoaded;
  }
}

class FeedsService extends Feeds {
  loadFeeds() {
    if (_isFeedsLoaded != null) {
      return null;
    }

    _feedsItems = [];
    _feedsData = feedsData;
    _feedsData.forEach((item) {
      FeedModel _feed = FeedModel(
        id: item['id'],
        title: item['title'],
        image: 'assets/images/${item['image']}',
        name: item['name'],
        logo: 'assets/images/${item['logo']}',
        time: item['time'],
        views: item['views'],
        likes: item['likes'],
      );
      _feedsItems.add(_feed);
    });
    _isFeedsLoaded = true;
    return null;
  }

}
