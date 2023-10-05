import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/storage_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firebase_storage_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/post_state.dart';

class DeletePostStateNotifier extends StateNotifier<PostState> {
  final StorageService storageService = FirebaseStorageProvider();
  DeletePostStateNotifier() : super(PostState.unknown());

  Future<bool> deletePost({required PostEntity postEntity}) async {
    try {
      state = state.copiedWithIsLoading(true);

      final result = await storageService.deletePostThumbnail(postEntity: postEntity);
      state = PostState(
        authFailureOrSuccessOption: some(result),
        isSubmitting: false,
        postEntity: postEntity,
      );
      // TODO: Delete comments and likes from cloud database
      await _deleteAllDocument(
        postID: postEntity.postID,
        inCollection: Constants.comments,
      );

      await _deleteAllDocument(
        postID: postEntity.postID,
        inCollection: Constants.likes,
      );

      final postInCollection = await FirebaseFirestore.instance
          .collection(Constants.posts)
          .where(
            Constants.postID,
            isEqualTo: postEntity.postID,
          )
          .limit(1)
          .get();

      for (final post in postInCollection.docs) {
        await post.reference.delete();
      }

      return true;
    } catch (_) {
      return false;
    } 
  }

  Future<void> _deleteAllDocument({
    required String postID,
    required String inCollection,
  }) {
    return FirebaseFirestore.instance.runTransaction(
        maxAttempts: 3,
        timeout: const Duration(seconds: 20), (transaction) async {
      final query = await FirebaseFirestore.instance
          .collection(inCollection)
          .where(
            Constants.postID,
            isEqualTo: postID,
          )
          .get();

      for (final doc in query.docs) {
        transaction.delete(doc.reference);
      }
    });
  }
}
