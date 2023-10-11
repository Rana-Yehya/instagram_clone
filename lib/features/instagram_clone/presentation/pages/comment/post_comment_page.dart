import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/providers/is_sending_or_deleting_comment_loading_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/comment/post_comment_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/saving_page.dart';

@RoutePage()
class PostCommentPage extends HookWidget {
  final String postID;
  const PostCommentPage({super.key, required this.postID});

  @override
  Widget build(BuildContext context) {
    var isSaving = useState(false);
    return Consumer(
      builder: (context, ref, child) {
        // install the loading screen
        ref.listen<bool?>(isSendingOrDeletingCommentLoadingProvider, (_, next) {
          if (next == true) {
            isSaving.value = true;
          } else {
            isSaving.value = false;
          }
        });

        return Stack(
          children: [
            PostCommentView(
              postID: postID,
            ),
            SavingPage(
              isSaving: isSaving.value,
              text: Constants.loading,
            ),
          ],
        );
      },
    );
  }
}
