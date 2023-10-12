import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/router/app_router.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/date_sorting.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/user_id_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/user_info_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/delete_post_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/delete_post_storage_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/post_with_comments_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/user_permission_delete_post_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/comment/compact_comment_column.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/likes/likes_count_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/post_date_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/post_display_name_and_message_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/show_post_page.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/widgets/like_button.dart';
import 'package:share_plus/share_plus.dart';

class PostDetailsView extends ConsumerStatefulWidget {
  final PostEntity postEntity;
  const PostDetailsView({super.key, required this.postEntity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostDetailsViewState();
}

class _PostDetailsViewState extends ConsumerState<PostDetailsView> {
  @override
  Widget build(BuildContext context) {
    final request = PostDetailsEntity(
      postID: widget.postEntity.postID,
      limit: 3,
      sortByCreateAt: true,
      dateSorting: DateSorting.oldestOnTop,
    );
    final userInfo = ref.watch(userInfoProvider(widget.postEntity.userID));
    final userID = ref.watch(userIDProvider);

    final userInfoDisplayName = userInfo.when(
      data: (data) => data.fold(
        (l) => null,
        (r) => r.displayName,
      ),
      error: (error, stackError) => null,
      loading: () => null,
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
                    await ref
                        .read(deletePostProvider.notifier)
                        .deletePost(postID: widget.postEntity.postID);
                    await ref
                        .read(deletePostStorageProvider.notifier)
                        .deletePost(postEntity: widget.postEntity);
                    if (mounted) {
                      context.popRoute();
                    }
                  },
                  btnCancelText: 'No',
                  btnCancelOnPress: () {
                    context.popRoute();
                  },
                ).show();
              },
            ),
        ],
      ),
      body: postAndComments.when(
        data: (postAndComments) {
          final postID = postAndComments.postEntity.postID;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ShowPostPage(
                  postEntity: postAndComments.postEntity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (postAndComments.postEntity.allowsLikes)
                      LikeButton(
                        postID: postID,
                        userID: userID!,
                      ),
                    if (postAndComments.postEntity.allowsComments)
                      IconButton(
                        onPressed: () {
                          context.pushRoute(
                            PostCommentRoute(postID: postID),
                          );
                        },
                        icon: const Icon(
                          Icons.mode_comment_outlined,
                        ),
                      ),
                  ],
                ),
                (userInfoDisplayName != null)
                    ? PostDisplayNameAndMessageView(
                        displayName: userInfoDisplayName,
                        message: postAndComments.postEntity.message,
                      )
                    : const Card(),
                PostDateView(dateTime: widget.postEntity.createdAt!),
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                CompactCommentColumn(
                  commentEntityList: postAndComments.commentEntityList,
                ),
                if (postAndComments.postEntity.allowsLikes)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LikesCountView(
                      postID: postID,
                    ),
                  ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
        error: (error, StackTrace) {
          return const LottieAnimationView(
            lottieAnimation: LottieAnimation.error,
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
