import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/post_blogger_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/post_blogger_card.dart';

class FeedsList extends StatelessWidget {
  final List<PostBloggerModel> _feedsList;

  FeedsList(this._feedsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _feedsList.length,
      itemBuilder: (context, index) {
        return PostBloggerCard(_feedsList[index]);
      },
    );
  }
}
