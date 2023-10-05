import 'package:dartz/dartz.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';

class ImageUploaderState {
  final Option<Either<CloudStorageFailure, Unit>>
      authFailureOrSuccessOption;
  final bool isSubmitting;
  ImageUploaderState({
    required this.authFailureOrSuccessOption,
    required this.isSubmitting,
  });

  ImageUploaderState.unknown()
      : authFailureOrSuccessOption = none(),
        isSubmitting = false;

  ImageUploaderState copiedWithIsLoading(bool isLoading) => ImageUploaderState(
        authFailureOrSuccessOption: authFailureOrSuccessOption,
        isSubmitting: isLoading,
      );
  @override
  bool operator ==(covariant ImageUploaderState other) =>
      identical(this, other) ||
      (authFailureOrSuccessOption == other.authFailureOrSuccessOption &&
          isSubmitting == other.isSubmitting);

  @override
  int get hashCode => Object.hash(
        authFailureOrSuccessOption,
        isSubmitting,
      );
}
