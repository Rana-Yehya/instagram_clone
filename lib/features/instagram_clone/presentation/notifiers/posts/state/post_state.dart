import 'package:dartz/dartz.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';

class PostState {
  final Option<Either<CloudStorageFailure, Unit>> authFailureOrSuccessOption;
  final bool isSubmitting;
  //final PostEntity postEntity;
  PostState({
    required this.authFailureOrSuccessOption,
    required this.isSubmitting,
  });

  PostState.unknown()
      : authFailureOrSuccessOption = none(),
        isSubmitting = false;

  PostState copiedWithIsLoading(bool isLoading) => PostState(
        authFailureOrSuccessOption: authFailureOrSuccessOption,
        isSubmitting: isLoading,
      );

  @override
  bool operator ==(covariant PostState other) =>
      identical(this, other) ||
      (authFailureOrSuccessOption == other.authFailureOrSuccessOption &&
          isSubmitting == other.isSubmitting);

  @override
  int get hashCode => Object.hash(
        authFailureOrSuccessOption,
        isSubmitting,
      );
}
