import 'package:dartz/dartz.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';

class AuthStorageState {
  final Option<Either<CloudStorageFailure, Unit>> authFailureOrSuccessOption;
  final bool isSubmitting;
  AuthStorageState({
    required this.authFailureOrSuccessOption,
    required this.isSubmitting,
  });

  AuthStorageState.unknown()
      : authFailureOrSuccessOption = none(),
        isSubmitting = false;

  AuthStorageState copiedWithIsLoading(bool isLoading) => AuthStorageState(
        authFailureOrSuccessOption: authFailureOrSuccessOption,
        isSubmitting: isLoading,
      );
  AuthStorageState copiedWithUniqueID(UniqueId userUniqueID) =>
      AuthStorageState(
        authFailureOrSuccessOption: authFailureOrSuccessOption,
        isSubmitting: false,
      );
  @override
  bool operator ==(covariant AuthStorageState other) =>
      identical(this, other) ||
      (authFailureOrSuccessOption == other.authFailureOrSuccessOption &&
          isSubmitting == other.isSubmitting);

  @override
  int get hashCode => Object.hash(
        authFailureOrSuccessOption,
        isSubmitting,
      );
}
