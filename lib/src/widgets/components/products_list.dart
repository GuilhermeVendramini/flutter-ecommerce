import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/product_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/product_card.dart';

class ProductsList extends StatelessWidget {
  final List<ProductModel> _productsList;

  ProductsList(this._productsList);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    int count = (orientation == Orientation.portrait) ? 1 : 2;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: count),
      itemCount: _productsList.length,
      itemBuilder: (context, index) {
        return ProductCard(_productsList[index]);
      },
    );
  }
}
