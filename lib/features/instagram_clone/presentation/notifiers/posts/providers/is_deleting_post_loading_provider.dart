// is_deleting_post_loading_provider
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/delete_post_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/delete_post_storage_provider.dart';

final isDeletingPostLoadingProvider = Provider<bool?>((ref) {
  final deletingPost = ref.watch(deletePostProvider);
  final deletePostStorage = ref.watch(deletePostStorageProvider);

  return deletingPost.isSubmitting || deletePostStorage.isSubmitting;
});
