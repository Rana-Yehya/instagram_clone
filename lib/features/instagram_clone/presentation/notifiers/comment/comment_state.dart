import 'package:dartz/dartz.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';

class CommentState {
  final Option<Either<CloudStorageFailure, Unit>> authFailureOrSuccessOption;
  final bool isSubmitting;
  CommentState({
    required this.authFailureOrSuccessOption,
    required this.isSubmitting,
  });

  CommentState.unknown()
      : authFailureOrSuccessOption = none(),
        isSubmitting = false;

  CommentState copiedWithIsLoading(bool isLoading) => CommentState(
        authFailureOrSuccessOption: authFailureOrSuccessOption,
        isSubmitting: isLoading,
      );

  @override
  bool operator ==(covariant CommentState other) =>
      identical(this, other) ||
      (authFailureOrSuccessOption == other.authFailureOrSuccessOption &&
          isSubmitting == other.isSubmitting);

  @override
  int get hashCode => Object.hash(
        authFailureOrSuccessOption,
        isSubmitting,
      );
}
