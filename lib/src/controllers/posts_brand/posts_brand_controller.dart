import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/posts_brand_data.dart';
import 'package:flutter_ecommerce/src/models/post_brand_model.dart';

class PostsBrandController with ChangeNotifier {
  List<Map<String, dynamic>> _postsBrandData;
  List<PostBrandModel>  _postsBrand = [];
  Iterable<PostBrandModel>  _postBrand;
  bool _isPostsBrandLoaded;
}

class PostsBrand extends PostsBrandController {
  List<PostBrandModel> get getPostsBrandItems {
    return _postsBrand;
  }

  PostBrandModel getPostBrand(int id) {
    _postBrand = _postsBrand.where((post) => post.id == id);
    return _postBrand.first;
  }

  bool get isPostsBrandLoaded {
    return _isPostsBrandLoaded;
  }
}

class PostsBrandService extends PostsBrand {
  loadPostsBrand() {
    if (_isPostsBrandLoaded != null) {
      return null;
    }

    _postsBrand = [];
    _postsBrandData = postsBrandData;
    _postsBrandData.forEach((item) {
      PostBrandModel _postBrand = PostBrandModel(
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
      _postsBrand.add(_postBrand);
    });
    _isPostsBrandLoaded = true;
    return null;
  }
}
