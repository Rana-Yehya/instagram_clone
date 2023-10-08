import 'package:flutter/material.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/show_image_post_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/show_video_post_view.dart';

class ShowPostPage extends StatelessWidget {
  final PostEntity postEntity;
  const ShowPostPage({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    switch (postEntity.imageOrVideo) {
      case ImageOrVideo.image:
        return ShowImagePostView(
          postEntity: postEntity,
        );
      case ImageOrVideo.video:
        return ShowVideoPostView(
          postEntity: postEntity,
        );
      default:
        return const SizedBox();
    }
  }
}
