import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/router/app_router.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_thumbnail/post_thumbnail_view.dart';

class PostsGridView extends StatelessWidget {
  final Iterable<PostEntity> posts;
  const PostsGridView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) => PostThumbnailView(
        post: posts.elementAt(index),
        onTapPressed: () {
          context.pushRoute(
            PostDetailsRoute(
              postEntity: posts.elementAt(index),
            ),
          );
        },
      ),
    );
  }
}
