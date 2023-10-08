import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/date_sorting.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/delete_post_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/post_with_comments_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/user_permission_delete_post_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/post_details_view.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()


class PostDetailsPage extends ConsumerStatefulWidget {
  final PostEntity postEntity;
  const PostDetailsPage({
    super.key,
    required this.postEntity,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostDetailsPageState();
}

class _PostDetailsPageState extends ConsumerState<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final request = PostDetailsEntity(
      postID: widget.postEntity.postID,
      limit: 3,
      sortByCreateAt: true,
      dateSorting: DateSorting.oldestOnTop,
    );

    final postAndComments = ref.watch(
      postWithCommentsProvider(request),
    );
    final fileURL =
        postAndComments.whenData((value) => value.postEntity.fileURL).value;

    final canDeletePost = ref.watch(
      userPermissionDeletePostProvider(widget.postEntity),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.postDetails),
        actions: [
          IconButton(
            onPressed: () {
              if (fileURL != null) {
                Share.share(
                  fileURL,
                  subject: Constants.checkOutThisPost,
                );
              }
            },
            icon: const Icon(Icons.share),
          ),
          if (canDeletePost.value ?? false)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.question,
                  title: Constants.delete,
                  desc: Constants.areYouSureYouWantToDeleteThis,
                  btnOkText: "Yes",
                  btnOkOnPress: () async {
                    ref.read(deletePostProvider.notifier).deletePost(
                          postID: widget.postEntity.postID,
                        );
                  },
                  btnCancelText: 'No',
                  btnCancelOnPress: () {
                    context.popRoute();
                  },
                ).show();

                if (mounted) {
                  context.popRoute();
                }
              },
            ),
        ],
      ),
      body: PostDetailsView(postEntity: widget.postEntity),
    );
  }
}
