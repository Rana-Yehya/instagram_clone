import 'package:dartz/dartz.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/data/user_auth_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';

abstract class FirestoreService {
  Future<Either<CloudStorageFailure, Unit>> saveUserData({
    required UserAuthEntity userAuthEntity,
  });
  Future<Either<CloudStorageFailure, UserAuthEntity>> getUserData({
    required UniqueId userID,
  }) ;
  Future<Either<CloudStorageFailure, Iterable<PostEntity>>> getUserPosts({
    required UniqueId userID,
  });
  Future<Either<CloudStorageFailure, Unit>> saveUserPost({
    required PostEntity postEntity,
  });
  /*
  Future<bool> saveUserPost({
    required String postID,
    required PostEntity postEntity,
  });
  */
}
