import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/brands_data.dart';
import 'package:flutter_ecommerce/src/models/brand_model.dart';

class BrandsController with ChangeNotifier {
  List<Map<String, dynamic>> _brandsData;
  List<BrandModel> _brands = [];
  Iterable<BrandModel> _brand;
  bool _isBrandsLoaded;
}

class Brands extends BrandsController {
  List<BrandModel> get getBrandsItems {
    return _brands;
  }

  BrandModel getBrand(int id) {
    _brand = _brands.where((brand) => brand.id == id);
    return _brand.first;
  }

  bool get isBrandsLoaded {
    return _isBrandsLoaded;
  }
}

class BrandsService extends Brands {
  loadBrands() {
    if (_isBrandsLoaded != null) {
      return null;
    }

    _brands = [];
    _brandsData = brandsData;
    _brandsData.forEach((item) {
      BrandModel _brand = BrandModel(
        id: item['id'],
        title: item['title'],
        logo: 'assets/images/${item['logo']}',
        followers: item['followers'],
        slogan: item['slogan'],
      );
      _brands.add(_brand);
    });
    _isBrandsLoaded = true;
    return null;
  }
}
