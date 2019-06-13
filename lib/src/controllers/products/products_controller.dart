import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/products_data.dart';
import 'package:flutter_ecommerce/src/models/slider_model.dart';
import 'package:flutter_ecommerce/src/models/product_model.dart';

class ProductsController with ChangeNotifier {
  List<Map<String, dynamic>> _productsData;
  List<ProductModel> _products = [];
  List<ProductModel> _product;
  bool _isProductsLoaded;
}

class Products extends ProductsController {
  List<ProductModel> get getProductsItems {
    return _products;
  }

  ProductModel getProduct(int id) {
    _product = _products.where((product) => product.id == id).toList();
    return _product.first;
  }

  bool get isProductsLoaded {
    return _isProductsLoaded;
  }
}

class ProductsService extends Products {
  loadProducts() {
    if (_isProductsLoaded != null) {
      return null;
    }

    _products = [];
    _productsData = productsData;
    _productsData.forEach((item) {
      List<SliderModel> _gallery = [];
      item['gallery'].forEach((galleryItem) {
        _gallery.add(SliderModel(
          image: 'assets/images/${galleryItem['image']}',
        ));
      });

      ProductModel _product = ProductModel(
        id: item['id'],
        title: item['title'],
        description: item['description'],
        image: 'assets/images/${item['image']}',
        brandName: item['brand_name'],
        brandId: item['brand_id'],
        price: item['price'],
        logo: 'assets/images/${item['logo']}',
        specification: item['specification'],
        gallery: _gallery,
      );
      _products.add(_product);
    });
    _isProductsLoaded = true;
    return null;
  }
}
