import 'package:dartz/dartz.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/failures/storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/thumbnail/thumbnail_storage_payload.dart';

class ImageUploaderStorageState {
  final Option<Either<StorageFailure, ThumbnailStoragePayload>>
      authFailureOrSuccessOption;
  final bool isSubmitting;
  ImageUploaderStorageState({
    required this.authFailureOrSuccessOption,
    required this.isSubmitting,
  });

  ImageUploaderStorageState.unknown()
      : authFailureOrSuccessOption = none(),
        isSubmitting = false;

  ImageUploaderStorageState copiedWithIsLoading(bool isLoading) =>
      ImageUploaderStorageState(
        authFailureOrSuccessOption: authFailureOrSuccessOption,
        isSubmitting: isLoading,
      );
  @override
  bool operator ==(covariant ImageUploaderStorageState other) =>
      identical(this, other) ||
      (authFailureOrSuccessOption == other.authFailureOrSuccessOption &&
          isSubmitting == other.isSubmitting);

  @override
  int get hashCode => Object.hash(
        authFailureOrSuccessOption,
        isSubmitting,
      );
}
