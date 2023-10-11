import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/state/post_state.dart';

class DeletePostNotifier extends StateNotifier<PostState> {
  final FirestoreService cloudService = FirebaseFirestoreProvider();
  DeletePostNotifier() : super(PostState.unknown());

  Future<void> deletePost({required String postID}) async {
    state = state.copiedWithIsLoading(true);

    final result = await cloudService.deleteUserPost(postID: postID);
    state = PostState(
      authFailureOrSuccessOption: some(result),
      isSubmitting: false,
    );
  }
}
