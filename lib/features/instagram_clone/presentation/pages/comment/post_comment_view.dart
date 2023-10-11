import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/user_id_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/providers/post_comments_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/providers/send_and_delete_comment_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/empty_content_with_text_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/comment/comment_tile.dart';

class PostCommentView extends HookConsumerWidget {
  final String postID;
  final keyboardHeight = 70.0;
  const PostCommentView({super.key, required this.postID});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = useTextEditingController();
    final hasText = useState(false);

    final request = useState(PostDetailsEntity(postID: postID));
    AsyncValue<Iterable<CommentEntity>> comments =
        ref.watch(postCommentsProvider(request.value));
    useEffect(() {
      commentController.addListener(() {
        hasText.value = commentController.text.isNotEmpty;
      });
      return () {};
    }, [commentController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.comments),
        actions: [
          IconButton(
            onPressed: hasText.value
                ? () async {
                    await _submitCommentWithController(commentController, ref);
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
              child: comments.when(
                data: (commentsDisplayed) {
                  if (commentsDisplayed.isEmpty) {
                    return const SingleChildScrollView(
                      child: EmptyContentWithTextAnimation(
                        text: Constants.noCommentsYet,
                      ),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () {
                      comments = ref.refresh(
                        postCommentsProvider(request.value),
                      );
                      return Future.delayed(const Duration(seconds: 1));
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: commentsDisplayed.length,
                      itemBuilder: (context, index) {
                        final comment = commentsDisplayed.elementAt(index);
                        return CommentTile(commentEntity: comment);
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return const LottieAnimationView(
                    lottieAnimation: LottieAnimation.error,
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextField(
                    textInputAction: TextInputAction.send,
                    controller: commentController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: Constants.writeYourCommentHere,
                    ),
                    onSubmitted: (value) async {
                      await _submitCommentWithController(
                          commentController, ref);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitCommentWithController(
    TextEditingController controller,
    WidgetRef ref,
  ) async {
    final userID = ref.read(userIDProvider);
    if (userID == null) {
      return;
    }
    await ref.read(sendAndDeleteCommentProvider.notifier).sendComment(
          userID: userID,
          postID: postID,
          comment: controller.text,
        );

    controller.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
