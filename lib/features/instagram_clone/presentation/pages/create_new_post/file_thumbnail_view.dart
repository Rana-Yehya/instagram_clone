import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/thumbnail/thumbnail_request.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/provider/thumbnail_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';

class FileThumbnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;
  const FileThumbnailView({super.key, required this.thumbnailRequest});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(thumbnailProvider(thumbnailRequest));
    return thumbnail.when(data: (imageWithAspectRatio) {
      return AspectRatio(
        aspectRatio: imageWithAspectRatio.aspectRatio,
        child: imageWithAspectRatio.image,
      );
    }, error: (error, StackTrace) {
      return const LottieAnimationView(
        lottieAnimation: LottieAnimation.error,
      );
    }, loading: () {
      return const CircularProgressIndicator();
    });
  }
}
