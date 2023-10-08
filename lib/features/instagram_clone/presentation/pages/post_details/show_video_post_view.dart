import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';
import 'package:video_player/video_player.dart';

class ShowVideoPostView extends HookWidget {
  final PostEntity postEntity;
  const ShowVideoPostView({
    super.key,
    required this.postEntity,
  });

  @override
  Widget build(BuildContext context) {
    final controller = VideoPlayerController.networkUrl(
      Uri.parse(
        postEntity.fileURL,
      ),
    );
    final isVideoPlayerReady = useState(false);

    useEffect(() {
      controller.initialize().then((value) {
        isVideoPlayerReady.value = true;
        controller.setLooping(true);
        controller.play();
      });
      return controller.dispose;
    }, [controller]);

    switch (isVideoPlayerReady.value) {
      case true:
        return AspectRatio(
          aspectRatio: postEntity.aspectRatio,
          child: VideoPlayer(controller),
        );
      case false:
        return const LottieAnimationView(
          lottieAnimation: LottieAnimation.loading,
        );
      default:
        return const LottieAnimationView(
          lottieAnimation: LottieAnimation.error,
        );
    }
  }
}
