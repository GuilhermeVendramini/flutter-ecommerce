import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/post_blogger_model.dart';
import 'package:flutter_ecommerce/src/widgets/components/post_blogger_card.dart';

class TimelineBloggerList extends StatelessWidget {
  final List<PostBloggerModel> _posts;

  TimelineBloggerList(this._posts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        return PostBloggerCard(_posts[index]);
      },
    );
  }
}
