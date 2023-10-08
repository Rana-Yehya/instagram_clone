import 'package:dartz/dartz.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';

class LikesState {
  final Option<Either<CloudStorageFailure, bool>> authFailureOrSuccessOption;
  final bool isSubmitting;
  LikesState({
    required this.authFailureOrSuccessOption,
    required this.isSubmitting,
  });

  LikesState.unknown()
      : authFailureOrSuccessOption = none(),
        isSubmitting = false;

  LikesState copiedWithIsLoading(bool isLoading) => LikesState(
        authFailureOrSuccessOption: authFailureOrSuccessOption,
        isSubmitting: isLoading,
      );

  @override
  bool operator ==(covariant LikesState other) =>
      identical(this, other) ||
      (authFailureOrSuccessOption == other.authFailureOrSuccessOption &&
          isSubmitting == other.isSubmitting);

  @override
  int get hashCode => Object.hash(
        authFailureOrSuccessOption,
        isSubmitting,
      );
}
