import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/feeds_data.dart';
import 'package:flutter_ecommerce/src/models/feed_model.dart';

class FeedsController with ChangeNotifier {
  List<Map<String, dynamic>> _feedsData;
  List<FeedModel> _feeds = [];
  Iterable<FeedModel> _feed;
  bool _isFeedsLoaded;
}

class Feeds extends FeedsController {
  List<FeedModel> get getTrendsItems {
    return _feeds;
  }

  FeedModel getFeed(int id) {
    _feed = _feeds.where((trend) => trend.id == id);
    return _feed.first;
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

    _feeds = [];
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
        subtitle: item['subtitle'],
        content: item['content'],
      );
      _feeds.add(_feed);
    });
    _isFeedsLoaded = true;
    return null;
  }

}
