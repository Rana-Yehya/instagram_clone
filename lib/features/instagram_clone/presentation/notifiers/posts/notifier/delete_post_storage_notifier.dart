import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/storage_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firebase_storage_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/state/post_storage_state.dart';

class DeletePostStorageNotifier extends StateNotifier<PostStorageState> {
  final StorageService storageService = FirebaseStorageProvider();
  DeletePostStorageNotifier() : super(PostStorageState.unknown());

  Future<void> deletePost({required PostEntity postEntity}) async {
    state = state.copiedWithIsLoading(true);

    final result =
        await storageService.deletePostThumbnail(postEntity: postEntity);
    state = PostStorageState(
      authFailureOrSuccessOption: some(result),
      isSubmitting: false,
      postEntity: PostEntity.empty(),
    );
  }
}
