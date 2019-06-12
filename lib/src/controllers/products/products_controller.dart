import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/products_data.dart';
import 'package:flutter_ecommerce/src/models/product_model.dart';

class ProductsController with ChangeNotifier {
  List<Map<String, dynamic>> _productsData;
  List<ProductModel> _products = [];
  bool _isProductsLoaded;
}

class Products extends ProductsController {
  List<ProductModel> get getProductsItems {
    return _products;
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
      ProductModel _product = ProductModel(
        id: item['id'],
        title: item['title'],
        description: item['description'],
        image: 'assets/images/${item['image']}',
        brandId: item['brand_id'],
        price: item['price'],
        logo: 'assets/images/${item['logo']}',
      );
      _products.add(_product);
    });
    _isProductsLoaded = true;
    return null;
  }
}
