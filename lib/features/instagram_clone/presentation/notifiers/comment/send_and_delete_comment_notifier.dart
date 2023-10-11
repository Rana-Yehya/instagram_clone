import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/comment_state.dart';
import 'package:uuid/uuid.dart';

class SendAndDeleteCommentNotifier extends StateNotifier<CommentState> {
  final FirestoreService cloudService = FirebaseFirestoreProvider();
  SendAndDeleteCommentNotifier() : super(CommentState.unknown());

  Future<void> sendComment({
    required UniqueId userID,
    required String postID,
    required String comment,
  }) async {
    state = state.copiedWithIsLoading(true);
    final commentID = const Uuid().v1();
    final commentEntity = CommentEntity(
        commentID: commentID,
        comment: comment,
        userID: userID,
        postID: postID,
        createdAt: null);
    final result =
        await cloudService.savePostComment(commentEntity: commentEntity);
    state = CommentState(
      authFailureOrSuccessOption: some(result),
      isSubmitting: false,
    );
  }

  Future<void> deleteComment({
    required String commentID,
  }) async {
    state = state.copiedWithIsLoading(true);
    final result = await cloudService.deletePostComment(commentID: commentID);
    state = CommentState(
      authFailureOrSuccessOption: some(result),
      isSubmitting: false,
    );
  }
}
