import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/feed_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/feeds_card.dart';

class FeedsList extends StatelessWidget {
  final List<FeedModel> _feedsList;

  FeedsList(this._feedsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _feedsList.length,
      itemBuilder: (context, index) {
        return FeedsCard(_feedsList[index]);
      },
    );
  }
}
