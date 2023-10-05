import 'package:dartz/dartz.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/failures/auth_failure.dart';

class AuthState {
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;
  final bool isSubmitting;
  final UniqueId? userUniqueID;
  AuthState(
      {required this.authFailureOrSuccessOption,
      required this.isSubmitting,
      required this.userUniqueID});

  AuthState.unknown()
      : authFailureOrSuccessOption = none(),
        isSubmitting = false,
        userUniqueID = null;

  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        authFailureOrSuccessOption: authFailureOrSuccessOption,
        isSubmitting: isLoading,
        userUniqueID: userUniqueID,
      );

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (authFailureOrSuccessOption == other.authFailureOrSuccessOption &&
          isSubmitting == other.isSubmitting &&
          userUniqueID == other.userUniqueID);

  @override
  int get hashCode => Object.hash(
        authFailureOrSuccessOption,
        isSubmitting,
        userUniqueID,
      );
}
