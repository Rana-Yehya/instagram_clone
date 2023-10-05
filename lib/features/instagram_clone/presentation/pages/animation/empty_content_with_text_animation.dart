import 'package:flutter/material.dart';
import 'package:instagram_clone/core/themes/app_colors.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';

class EmptyContentWithTextAnimation extends StatelessWidget {
  final String text;
  const EmptyContentWithTextAnimation({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.whiteColor),
            ),
          ),
          const LottieAnimationView(lottieAnimation: LottieAnimation.empty),
        ],
      ),
    );
  }
}
