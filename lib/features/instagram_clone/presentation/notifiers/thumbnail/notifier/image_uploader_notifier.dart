import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_settings.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/thumbnail/thumbnail_storage_payload.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/state/image_uploader_state.dart';
import 'package:uuid/uuid.dart';

class ImageUploaderNotifier extends StateNotifier<ImageUploaderState> {
  final FirestoreService cloudService = FirebaseFirestoreProvider();
  ImageUploaderNotifier() : super(ImageUploaderState.unknown());
  Future<void> uploadToCloud({
    required ImageOrVideo imageOrVideo,
    required ThumbnailStoragePayload thumbnailStorageRequest,
    required String message,
    required Map<PostSetting, bool> postSettings,
    required UniqueId userID,
  }) async {
    state = state.copiedWithIsLoading(true);
    final postID = const Uuid().v4();
    final postEntity = PostEntity(
      postID: postID,
      userID: userID,
      message: message,
      thumbnailURL: thumbnailStorageRequest.thumbnailURLRef,
      fileURL: thumbnailStorageRequest.originalFileURLRef,
      imageOrVideo: imageOrVideo,
      fileName: thumbnailStorageRequest.thumbnailFileUID,
      aspectRatio: thumbnailStorageRequest.thumbnailAspectRatio,
      thumbnailStorageID: thumbnailStorageRequest.thumbStorageID,
      originalFileStorageID: thumbnailStorageRequest.originalFileStorageID,
      postSettings: postSettings,
      createdAt: null,
    );

    final result = await cloudService.saveUserPost(
      postEntity: postEntity,
    );

    state = ImageUploaderState(
      authFailureOrSuccessOption: some(result),
      isSubmitting: false,
    );
  }
}
