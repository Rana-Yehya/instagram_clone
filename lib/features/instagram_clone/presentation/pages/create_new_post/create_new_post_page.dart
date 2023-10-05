import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/create_new_post/create_new_post_view.dart';

@RoutePage()
class CreateNewPostPage extends StatelessWidget {
  final File fileName;
  final ImageOrVideo imageOrVideo;

  const CreateNewPostPage({
    super.key,
    required this.fileName,
    required this.imageOrVideo,
  });

  @override
  Widget build(BuildContext context) {
    return CreateNewPostView(
      fileName: fileName,
      imageOrVideo: imageOrVideo,
    );
  }
}
