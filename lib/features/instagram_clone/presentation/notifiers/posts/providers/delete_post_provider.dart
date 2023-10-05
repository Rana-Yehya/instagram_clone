import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/notifier/delete_post_notifier.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/post_state.dart';

final deletePostProvider =
    StateNotifierProvider<DeletePostStateNotifier, PostState>(
  (_) => DeletePostStateNotifier(),
);
