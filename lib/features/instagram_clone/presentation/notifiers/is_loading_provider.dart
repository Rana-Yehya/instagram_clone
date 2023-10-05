import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/delete_post_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/provider/image_uploader_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/provider/image_uploader_storage_provider.dart';

final isLoginLoadingProvider = Provider<bool?>((ref) {
  final authState = ref.watch(authStateProvider);
  final isDeletingPost = ref.watch(deletePostProvider);
  final imageUploader = ref.watch(imageUploaderProvider);
  final imageUploaderStorage = ref.watch(imageUploaderStorageProvider);
  /*
  final isSendingComment = ref.watch(sendCommentProvider);
  final isDeletingComment = ref.watch(deleteCommentStateProvider);
  
  */
  return authState.isSubmitting ||
          imageUploader.isSubmitting ||
          isDeletingPost.isSubmitting ||
          imageUploaderStorage
              .isSubmitting /*||
      isSendingComment ||
      isDeletingComment*/
      ;
});
