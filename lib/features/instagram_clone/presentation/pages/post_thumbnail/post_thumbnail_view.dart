import 'package:flutter/material.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';


// post card
class PostThumbnailView extends StatelessWidget {
  final PostEntity post;
  final VoidCallback onTapPressed;
  const PostThumbnailView(
      {super.key, required this.post, required this.onTapPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapPressed,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(post.thumbnailURL),
          ),
        ),
      ),
    );
  }
}
