import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/sales_data.dart';
import 'package:flutter_ecommerce/src/models/sale_model.dart';

class SalesController with ChangeNotifier {
  List<Map<String, dynamic>> _salesData;
  List<SaleModel> _sales = [];
  bool _isSalesLoaded;
}

class Sales extends SalesController {
  List<SaleModel> get getSalesItems {
    return _sales;
  }

  bool get isSalesLoaded {
    return _isSalesLoaded;
  }
}

class SalesService extends Sales {
  loadSales() {
    if (_isSalesLoaded != null) {
      return null;
    }

    _sales = [];
    _salesData = salesData;
    _salesData.forEach((item) {
      SaleModel _brand = SaleModel(
        id: item['id'],
        title: item['title'],
        description: item['description'],
        image: item['image'],
        brandId: item['brand_id'],
        productId: item['product_id'],
      );
      _sales.add(_brand);
    });
    _isSalesLoaded = true;
    return null;
  }
}
