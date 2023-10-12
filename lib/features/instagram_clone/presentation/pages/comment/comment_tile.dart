import 'package:another_flushbar/flushbar_helper.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/user_id_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/user_info_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/providers/send_and_delete_comment_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';

class CommentTile extends ConsumerWidget {
  final CommentEntity commentEntity;
  const CommentTile({super.key, required this.commentEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider(commentEntity.userID));
    final userID = ref.watch(userIDProvider);
    return userInfo.when(data: (posts) {
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
      }, (currentUserInfo) {
        returnedWidget = ListTile(
          trailing: currentUserInfo.userID == userID
              ? IconButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.question,
                      title: Constants.delete,
                      desc: Constants.areYouSureYouWantToDeleteThis,
                      btnOkText: "Yes",
                      btnOkOnPress: () async {
                        await ref
                            .read(sendAndDeleteCommentProvider.notifier)
                            .deleteComment(commentID: commentEntity.commentID);
                      },
                      btnCancelText: 'No',
                      btnCancelOnPress: () {},
                    ).show();
                  },
                  icon: const Icon(Icons.delete))
              : null,
          title: Text(currentUserInfo.displayName!),
          subtitle: Text(commentEntity.comment),
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
