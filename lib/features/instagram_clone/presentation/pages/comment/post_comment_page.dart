import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/comment/post_comment_view.dart';
@RoutePage()
class PostCommentPage extends StatelessWidget {
  final String postID;
  const PostCommentPage({super.key, required this.postID});

  @override
  Widget build(BuildContext context) {
    return PostCommentView(
      postID: postID,
    );
  }
}
