import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/router/app_router.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/date_sorting.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/user_info_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/post_with_comments_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/comment/compact_comment_column.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/likes/likes_count_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/post_date_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/post_display_name_and_message_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/show_post_page.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/widgets/like_button.dart';

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

    final userInfoUserID = userInfo
        .whenData((value) => value.fold(
              (l) => null,
              (r) => r.userID,
            ))
        .value;

    final userInfoDisplayName = userInfo
        .whenData((value) => value.fold(
              (l) => null,
              (r) => r.displayName,
            ))
        .value;
    final postAndComments = ref.watch(
      postWithCommentsProvider(request),
    );
    return postAndComments.when(data: (postAndComments) {
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
                    userID: userInfoUserID!,
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
    }, error: (error, StackTrace) {
      return const LottieAnimationView(
        lottieAnimation: LottieAnimation.error,
      );
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}

/*
class PostDetailsView extends ConsumerWidget {
  final PostEntity postEntity;
  const PostDetailsView({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final request = PostDetailsEntity(
      postID: postEntity.postID,
      limit: 3,
      sortByCreateAt: true,
      dateSorting: DateSorting.oldestOnTop,
    );
    final userInfoDisplayName = ref
        .watch(userInfoProvider(postEntity.userID))
        .whenData((value) => value.fold(
              (l) => null,
              (r) => r.displayName,
            ))
        .value;
    final postAndComments = ref.watch(
      postWithCommentsProvider(request),
    );
    return postAndComments.when(data: (postAndComments) {
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
            PostDateView(dateTime: postEntity.createdAt!),
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
    }, error: (error, StackTrace) {
      return const LottieAnimationView(
        lottieAnimation: LottieAnimation.error,
      );
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }

}
*/