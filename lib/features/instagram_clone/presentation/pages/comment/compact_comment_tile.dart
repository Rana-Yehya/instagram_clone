import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/user_info_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';

class CompactCommentTile extends ConsumerWidget {
  final CommentEntity commentEntity;
  const CompactCommentTile({
    super.key,
    required this.commentEntity
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(commentEntity);
    final userInfo = ref.watch(
      userInfoProvider(commentEntity.userID),
    );
    /*
    return userInfo.when(data: (userInfo) {
      return RichText(
        text: TextSpan(
          style: const TextStyle(
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: userInfo.displayName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: commentEntity.comment,
            )
          ],
        ),
      );
    }, error: (error, StackTrace) {
      return const LottieAnimationView(
        lottieAnimation: LottieAnimation.error,
      );
    }, loading: () {
      return const CircularProgressIndicator();
    });
    */
    return userInfo.when(data: (commentsEither) {
      Widget? returnedWidget;
      commentsEither.fold((failure) {
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
      }, (userInfo) {
        returnedWidget = RichText(
          text: TextSpan(
            style: const TextStyle(
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: "${userInfo.displayName}: ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: commentEntity.comment,
              )
            ],
          ),
        );
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
