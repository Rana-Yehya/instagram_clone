import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/likes/likes_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/likes/providers/has_liked_post_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/likes/providers/post_likes_dislikes_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';

class LikeButton extends ConsumerWidget {
  final String postID;
  final UniqueId userID;
  const LikeButton({super.key, required this.postID, required this.userID});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likesEntity = LikesEntity(
      postID: postID,
      likedBy: userID,
    );

    final hasUserLikedPost = ref.watch(hasUserLikedPostProvider(likesEntity));

    return hasUserLikedPost.when(data: (data) {
      return IconButton(
        onPressed: () {
          ref.read(
            postLikesDislikesProvider(likesEntity),
          );
        },
        icon: FaIcon(
          (data == true) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
        ),
      );
    }, error: (error, StackTrace) {
      return const LottieAnimationView(
        lottieAnimation: LottieAnimation.smallError,
      );
    }, loading: () {
      return const Padding(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
