import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/post_brand_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/post_brand_card.dart';

class TimelineList extends StatelessWidget {
  final List<PostBrandModel> _posts;

  TimelineList(this._posts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        return PostBrandCard(_posts[index]);
      },
    );
  }
}
