import 'package:dartz/dartz.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/failures/storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/thumbnail/thumbnail_storage_payload.dart';

class ImageUploaderStorageState {
  final Option<Either<StorageFailure, ThumbnailStoragePayload>>
      authFailureOrSuccessOption;
  final double thumbnailAspectRatio;
  final bool isSubmitting;
  ImageUploaderStorageState({
    required this.authFailureOrSuccessOption,
    required this.thumbnailAspectRatio,
    required this.isSubmitting,
  });

  ImageUploaderStorageState.unknown()
      : authFailureOrSuccessOption = none(),
        thumbnailAspectRatio = 0.0,
        isSubmitting = false;

  ImageUploaderStorageState copiedWithIsLoading(bool isLoading) =>
      ImageUploaderStorageState(
        authFailureOrSuccessOption: authFailureOrSuccessOption,
        thumbnailAspectRatio: thumbnailAspectRatio,
        isSubmitting: isLoading,
      );
  @override
  bool operator ==(covariant ImageUploaderStorageState other) =>
      identical(this, other) ||
      (authFailureOrSuccessOption == other.authFailureOrSuccessOption &&
          thumbnailAspectRatio == other.thumbnailAspectRatio &&
          isSubmitting == other.isSubmitting);

  @override
  int get hashCode => Object.hash(
        authFailureOrSuccessOption,
        thumbnailAspectRatio,
        isSubmitting,
      );
}
