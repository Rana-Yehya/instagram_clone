import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/likes/likes_state.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/likes/post_likes_dislikes_notifier.dart';

final postLikesDislikesProvider =
    StateNotifierProvider<PostLikesDislikesNotifier, LikesState>(
  (_) => PostLikesDislikesNotifier(),
);
