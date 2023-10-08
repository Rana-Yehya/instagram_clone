import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/providers/post_comments_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/providers/send_and_delete_comment_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/empty_content_with_text_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/comment/comment_tile.dart';

class PostCommentView extends HookConsumerWidget {
  final String postID;
  const PostCommentView({
    super.key,
    required this.postID,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = useTextEditingController();
    final hasText = useState(false);

    final request = useState(PostDetailsEntity(postID: postID));
    AsyncValue<Either<CloudStorageFailure, Iterable<CommentEntity>>> comments =
        ref.watch(postCommentsProvider(request.value));
    useEffect(() {
      commentController.addListener(() {
        hasText.value = commentController.text.isNotEmpty;
      });
      return () {};
    }, [commentController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.comment),
        actions: [
          IconButton(
            onPressed: hasText.value
                ? () {
                    final userID = ref.read(userIDProvider);
                    if (userID?.value.toString() != null) {
                      return;
                    }
                    ref.read(sendAndDeleteCommentProvider.notifier).sendComment(
                          userID: userID!,
                          postID: postID,
                          comment: commentController.text,
                        );
                  }
                : null,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 4,
              child: comments.when(data: (posts) {
                Widget? returnedWidget;
                posts.fold((failure) {
                  FlushbarHelper.createError(
                    message: failure.map(
                      unknown: (Unknown value) => 'Unknown',
                      objectNotFound: (ObjectNotFound value) =>
                          'Object Not Found',
                      cancelledByUser: (CancelledByUser value) => 'Cancelled',
                      unauthorized: (Unauthorized value) => 'Unauthorized',
                    ),
                    duration: const Duration(seconds: 3),
                  ).show(context);

                  returnedWidget = const Card();
                }, (commentsDisplayed) {
                  if (commentsDisplayed.isEmpty) {
                    returnedWidget = const EmptyContentWithTextAnimation(
                        text: Constants.noCommentsYet);
                  }
                  returnedWidget = RefreshIndicator(
                    onRefresh: () {
                      comments =
                          ref.refresh(postCommentsProvider(request.value));
                      return Future.delayed(
                        const Duration(
                          seconds: 1,
                        ),
                      );
                    },
                    child: ListView.builder(
                      itemCount: commentsDisplayed.length,
                      padding: const EdgeInsets.all(8.0),
                      itemBuilder: (context, index) {
                        final comment = commentsDisplayed.elementAt(index);
                        return CommentTile(commentEntity: comment);
                      },
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
              }),
            ),
            /*
              comments.when(data: (comments) {
                if (comments.isEmpty) {
                  return const EmptyContentWithTextAnimation(
                      text: Constants.noCommentsYet);
                }
                return RefreshIndicator(
                  onRefresh: () {
                    ref.refresh(postCommentsProvider(request.value)
                        as Refreshable<Future<void>>);
                    return Future.delayed(
                      const Duration(
                        seconds: 1,
                      ),
                    );
                  },
                  child: ListView.builder(
                      itemCount: comments.length,
                      padding: const EdgeInsets.all(8.0),
                      itemBuilder: (context, index) {
                        final comment = comments.elementAt(index);
                        return CommentTile(commentEntity: comment);
                      },),
                );
              }, error: (error, StackTrace) {
                return const LottieAnimationView(
                  lottieAnimation: LottieAnimation.error,
                );
              }, loading: () {
                return const CircularProgressIndicator();
              }),
              */

            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: TextField(
                    controller: commentController,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        final userID = ref.read(userIDProvider);
                        if (userID?.value.toString() != null) {
                          return;
                        }
                        ref
                            .read(sendAndDeleteCommentProvider.notifier)
                            .sendComment(
                              userID: userID!,
                              postID: postID,
                              comment: commentController.text,
                            );
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: Constants.writeYourCommentHere,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
