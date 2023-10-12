import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/posts_by_search_term_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/empty_content_with_text_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/lottie_animation_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/tabs/posts_sliver_grid_view.dart';

class SearchGridView extends ConsumerWidget {
  final String searchTerm;
  const SearchGridView({super.key, required this.searchTerm});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (searchTerm.isEmpty) {
      return const SliverToBoxAdapter(
        child: EmptyContentWithTextAnimation(
          text: Constants.enterYourSearchTerm,
        ),
      );
    }
    final posts = ref.watch(postsBySearchTermProvider(searchTerm));

    return posts.when(data: (data) {
      if (data.isEmpty) {
        return const SliverToBoxAdapter(
          child: LottieAnimationView(
            lottieAnimation: LottieAnimation.dataNotFound,
          ),
        );
      } else {
        return PostsSliverGridView(postEntityList: data);
      }
    }, error: (error, StackTrace) {
      return const SliverToBoxAdapter(
        child: LottieAnimationView(
          lottieAnimation: LottieAnimation.error,
        ),
      );
    }, loading: () {
      return const SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      );
    });
  }
}
