import 'package:flutter/material.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationView extends StatelessWidget {
  final LottieAnimation lottieAnimation;
  final bool repeat;
  final bool reverse;
  const LottieAnimationView(
      {super.key,
      required this.lottieAnimation,
      this.repeat = true,
      this.reverse = false});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/animation/${lottieAnimation.name}.json');
  }
}
