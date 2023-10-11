import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/notifier/delete_post_notifier.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/state/post_state.dart';

final deletePostProvider = StateNotifierProvider<DeletePostNotifier, PostState>(
  (_) => DeletePostNotifier(),
);