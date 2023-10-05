import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/likes/providers/post_likes_count_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';

class LikesCountView extends ConsumerWidget {
  final String postID;
  const LikesCountView({
    super.key,
    required this.postID,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likesCount = ref.watch(
      postLikesCountProvider(postID),
    );
    return likesCount.when(data: (likes) {
      Widget? returnedWidget;
      likes.fold((failure) {
        FlushbarHelper.createError(
          message: failure.map(
            unknown: (Unknown value) => 'Unknown',
            objectNotFound: (ObjectNotFound value) => 'Object Not Found',
            cancelledByUser: (CancelledByUser value) => 'Cancelled',
            unauthorized: (Unauthorized value) => 'Unauthorized',
          ),
          duration: const Duration(seconds: 3),
        ).show(context);

        returnedWidget = const Card();
      }, (likesCount) {
        final people = likesCount == 1 ? Constants.person : Constants.people;
        final likesText = '$likes $people ${Constants.likedThis}';
        returnedWidget = Text(likesText);
      });
      return returnedWidget ?? const Card();
    }, error: (error, StackTrace) {
      return const LottieAnimationView(
        lottieAnimation: LottieAnimation.error,
      );
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
