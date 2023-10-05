import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/comment_state.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/send_and_delete_comment_notifier.dart';

final sendAndDeleteCommentProvider =
    StateNotifierProvider<SendAndDeleteCommentNotifier, CommentState>(
  (_) => SendAndDeleteCommentNotifier(),
);
