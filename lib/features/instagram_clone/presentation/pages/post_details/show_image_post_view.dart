import 'package:flutter/material.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';

class ShowImagePostView extends StatelessWidget {
  final PostEntity postEntity;
  const ShowImagePostView({
    super.key,
    required this.postEntity,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: postEntity.aspectRatio,
      child: Image.network(
        postEntity.fileURL,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
