import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/data/user_auth_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/likes/likes_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details_entity.dart';

abstract class FirestoreService {
  Future<Either<CloudStorageFailure, Unit>> saveUserData({
    required UserAuthEntity userAuthEntity,
  });
  Future<Either<CloudStorageFailure, UserAuthEntity>> getUserData({
    required UniqueId userID,
  });
  Future<Either<CloudStorageFailure, Iterable<PostEntity>>> getUserPosts({
    required UniqueId userID,
  });
  Future<Either<CloudStorageFailure, Unit>> saveUserPost({
    required PostEntity postEntity,
  });
  Future<Either<CloudStorageFailure, bool>> saveUserOnPostLikesOrDislike({
    required LikesEntity likesEntity,
  });
  Either<CloudStorageFailure, Stream<int>> getUserPostLikes({
    required String postID,
  });
  Either<CloudStorageFailure, Stream<bool>> hasUserLikedPost({
    required LikesEntity likesEntity,
  });
  Future<Either<CloudStorageFailure, Unit>> savePostComment({
    required CommentEntity commentEntity,
  });
  Future<Either<CloudStorageFailure, Unit>> deletePostComment({
    required String commentID,
  });
  Either<CloudStorageFailure, Stream<Iterable<CommentEntity>>>
      getUserPostComment({
    required PostDetailsEntity postDetailsEntity,
  });
  Future<Either<CloudStorageFailure, Unit>> deleteUserPost({
    required String postID,
  });
  Future<Either<CloudStorageFailure, PostCommentsEntity>> getUserPostDetails(
      {required PostDetailsEntity postDetailsEntity});
  /*
  Future<bool> saveUserPost({
    required String postID,
    required PostEntity postEntity,
  });
  */
}
