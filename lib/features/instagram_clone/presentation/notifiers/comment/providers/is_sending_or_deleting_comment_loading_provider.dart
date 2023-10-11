import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/providers/send_and_delete_comment_provider.dart';

final isSendingOrDeletingCommentLoadingProvider = Provider<bool?>((ref) {
  final isSendingOrDeletingComment = ref.watch(sendAndDeleteCommentProvider);

  return isSendingOrDeletingComment.isSubmitting;
});
