import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/posts_blogger_data.dart';
import 'package:flutter_ecommerce/src/models/post_blogger_model.dart';

class PostsBloggerController with ChangeNotifier {
  List<Map<String, dynamic>> _postsBloggerData;
  List<PostBloggerModel> _postsBlogger = [];
  Iterable<PostBloggerModel> _postBlogger;
  bool _isPostsBloggerLoaded;
}

class PostsBlogger extends PostsBloggerController {
  List<PostBloggerModel> get getPostsBlogger {
    return _postsBlogger;
  }

  PostBloggerModel getPostBlogger(int id) {
    _postBlogger = _postsBlogger.where((post) => post.id == id);
    return _postBlogger.first;
  }

  bool get isPostsBloggerLoaded {
    return _isPostsBloggerLoaded;
  }
}

class PostsBloggerService extends PostsBlogger {
  loadPostsBlogger() {
    if (_isPostsBloggerLoaded != null) {
      return null;
    }

    _postsBlogger = [];
    _postsBloggerData = postsBloggerData;
    _postsBloggerData.forEach((item) {
      PostBloggerModel _postBlogger = PostBloggerModel(
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
        gallery: item['gallery'],
      );
      _postsBlogger.add(_postBlogger);
    });
    _isPostsBloggerLoaded = true;
    return null;
  }

}
