import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/notifier/delete_post_storage_notifier.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/state/post_storage_state.dart';

final deletePostStorageProvider =
    StateNotifierProvider<DeletePostStorageNotifier, PostStorageState>(
  (_) => DeletePostStorageNotifier(),
);
