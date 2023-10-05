import 'package:dartz/dartz.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/failures/storage_failure.dart';

class PostState {
  final Option<Either<StorageFailure, Unit>> authFailureOrSuccessOption;
  final bool isSubmitting;
  final PostEntity postEntity;
  PostState(
      {required this.authFailureOrSuccessOption,
      required this.isSubmitting,
      required this.postEntity});

  PostState.unknown()
      : authFailureOrSuccessOption = none(),
        isSubmitting = false,
        postEntity = PostEntity.empty();

  PostState copiedWithIsLoading(bool isLoading) => PostState(
        authFailureOrSuccessOption: authFailureOrSuccessOption,
        isSubmitting: isLoading,
        postEntity: postEntity,
      );

  @override
  bool operator ==(covariant PostState other) =>
      identical(this, other) ||
      (authFailureOrSuccessOption == other.authFailureOrSuccessOption &&
          isSubmitting == other.isSubmitting &&
          postEntity == other.postEntity);

  @override
  int get hashCode => Object.hash(
        authFailureOrSuccessOption,
        isSubmitting,
        postEntity,
      );
}
