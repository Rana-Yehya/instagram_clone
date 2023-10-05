import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/user_posts_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/empty_content_with_text_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_thumbnail/posts_grid_view.dart';

class UserInfoView extends ConsumerWidget {
  const UserInfoView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Either<CloudStorageFailure, Iterable<PostEntity>>> posts =
        ref.watch(userPostsProvider);
    return RefreshIndicator(
      onRefresh: () {
        posts = ref.refresh(userPostsProvider);
        return Future.delayed(const Duration(seconds: 1));
      },
      child: posts.when(data: (posts) {
        Widget? returnedWidget;
        posts.fold((failure) {
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
        }, (posts) {
          if (posts.isEmpty) {
            returnedWidget = const EmptyContentWithTextAnimation(
              text: Constants.youHaveNoPosts,
            );
          } else {
            returnedWidget = PostsGridView(posts: posts);
          }
        });
        return returnedWidget ?? const Card();
      }, error: (error, StackTrace) {
        return const LottieAnimationView(
          lottieAnimation: LottieAnimation.error,
        );
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
