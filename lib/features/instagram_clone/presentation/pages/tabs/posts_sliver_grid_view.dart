import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/router/app_router.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_thumbnail/post_thumbnail_view.dart';

class PostsSliverGridView extends StatelessWidget {
  final Iterable<PostEntity> postEntityList;
  const PostsSliverGridView({super.key, required this.postEntityList});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: postEntityList.length,
        (BuildContext context, int index) => PostThumbnailView(
          post: postEntityList.elementAt(index),
          onTapPressed: () {
            context.pushRoute(
              PostDetailsRoute(
                postEntity: postEntityList.elementAt(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
