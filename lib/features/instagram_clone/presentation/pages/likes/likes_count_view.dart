import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/likes/providers/post_likes_count_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';

class LikesCountView extends ConsumerWidget {
  final String postID;
  const LikesCountView({super.key, required this.postID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likesCount = ref.watch(
      postLikesCountProvider(postID),
    );

    return likesCount.when(data: (likesCount) {
      final people = likesCount == 1 ? Constants.person : Constants.people;
      final likesText = '$likesCount $people ${Constants.likedThis}';
      return Text(likesText);
    }, error: (error, StackTrace) {
      return const LottieAnimationView(
        lottieAnimation: LottieAnimation.error,
      );
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
