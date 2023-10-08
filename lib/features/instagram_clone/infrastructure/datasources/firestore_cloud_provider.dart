import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/data/user_auth_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/likes/likes_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/auth/user_auth_payload.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/comment/comment_entity_payload.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/likes/likes_entity_payload.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/post/post_entity_payload.dart';

@LazySingleton(as: FirestoreService)
class FirebaseFirestoreProvider extends FirestoreService {
  FirebaseFirestoreProvider();
  @override
  Future<Either<CloudStorageFailure, Unit>> saveUserData({
    required UserAuthEntity userAuthEntity,
  }) async {
    try {
      final document = FirebaseFirestore.instance.collection(Constants.users);
      final payload = UserAuthPayload.fromDomain(userAuthEntity);
      document.doc(payload.userID).set(payload.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Future<Either<CloudStorageFailure, UserAuthEntity>> getUserData({
    required UniqueId userID,
  }) async {
    Map<String, dynamic> json = <String, dynamic>{};
    try {
      await FirebaseFirestore.instance
          .collection(Constants.users)
          .where(Constants.userID, isEqualTo: userID.getOrCrash())
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          final doc = snapshot.docs.first;
          json = doc.data();
        }
      });

      if (json != <String, dynamic>{}) {
        final userAuthPayload = UserAuthPayload.fromJson(
          json,
        );
        final userAuthEntity = userAuthPayload.toDomain();

        return right(userAuthEntity);
      } else {
        return left(const CloudStorageFailure.objectNotFound());
      }
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Future<Either<CloudStorageFailure, Iterable<PostEntity>>> getUserPosts({
    required UniqueId userID,
  }) async {
    try {
      Iterable<PostEntity>? postEntityList;
      final document = FirebaseFirestore.instance.collection(Constants.posts);

      final descendingDoc =
          document.orderBy(Constants.createdAt, descending: true);
      await descendingDoc
          .where(Constants.userID, isEqualTo: userID.getOrCrash())
          .get()
          .then((value) {
        final posts = value.docs.map(
          (doc) => PostEntityPayload.fromFirestore(doc),
        );
        postEntityList = posts.map((post) => post.toDomain());
      });

      if (postEntityList == const Iterable.empty() || postEntityList == null) {
        return right(const Iterable.empty());
      } else {
        return right(postEntityList!);
      }
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Future<Either<CloudStorageFailure, Unit>> saveUserPost(
      {required PostEntity postEntity}) async {
    try {
      final postDTO = PostEntityPayload.fromDomain(postEntity);
      final postJson = postDTO.toJson();
      await FirebaseFirestore.instance
          .collection(Constants.posts)
          .add(postJson);
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Future<Either<CloudStorageFailure, bool>> saveUserOnPostLikesOrDislike(
      {required LikesEntity likesEntity}) async {
    try {
      final document = FirebaseFirestore.instance
          .collection(Constants.likes)
          .where(
            Constants.postID,
            isEqualTo: likesEntity.postID,
          )
          .where(
            Constants.userID,
            isEqualTo: likesEntity.likedBy.getOrCrash(),
          )
          .get();
      final hasLiked =
          await document.then((snapshots) => snapshots.docs.isNotEmpty);

      if (hasLiked) {
        await document.then((snapshot) async {
          for (final doc in snapshot.docs) {
            await doc.reference.delete();
          }
        });
        return right(false);
      } else {
        final likesEntityDTO = LikesEntityPayload.fromDomain(likesEntity);

        await FirebaseFirestore.instance.collection(Constants.likes).add(
              likesEntityDTO.toJson(),
            );
        return right(true);
      }
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Future<Either<CloudStorageFailure, int>> getUserPostLikes(
      {required String postID}) async {
    try {
      //int numberOfCounts = 0;
      final document = FirebaseFirestore.instance.collection(Constants.likes);

      int numberOfCounts = await document
          .where(Constants.postID, isEqualTo: postID)
          .snapshots()
          .length;

      return right(numberOfCounts);
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Either<CloudStorageFailure, Stream<bool>> hasUserLikedPost({
    required LikesEntity likesEntity,
  }) {
    StreamController<bool> controller = StreamController<bool>();
    try {
      FirebaseFirestore.instance
          .collection(Constants.likes)
          .where(
            Constants.postID,
            isEqualTo: likesEntity.postID,
          )
          .where(
            Constants.userID,
            isEqualTo: likesEntity.likedBy.getOrCrash(),
          )
          .snapshots()
          .listen((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          controller.add(true);
        } else {
          controller.add(false);
        }
      });
      return right(controller.stream);
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Future<Either<CloudStorageFailure, Unit>> savePostComment({
    required CommentEntity commentEntity,
  }) async {
    try {
      final commentPayload = CommentEntityPayload.fromDomain(commentEntity);
      await FirebaseFirestore.instance
          .collection(Constants.comments)
          .add(commentPayload.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Future<Either<CloudStorageFailure, Unit>> deletePostComment({
    required String commentID,
  }) async {
    try {
      final document = FirebaseFirestore.instance
          .collection(Constants.comment)
          .where(FieldPath.documentId, isEqualTo: commentID)
          .limit(1)
          .get();

      await document.then((query) async {
        for (final doc in query.docs) {
          await doc.reference.delete();
        }
      });
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Future<Either<CloudStorageFailure, Iterable<CommentEntity>>>
      getUserPostComment({
    required PostDetailsEntity postDetailsEntity,
  }) async {
    try {
      final document = await FirebaseFirestore.instance
          .collection(Constants.comment)
          .where(Constants.postID, isEqualTo: postDetailsEntity.postID)
          .get();
      final docs = document.docs;
      final limitedComments = postDetailsEntity.limit != null
          ? docs.take(postDetailsEntity.limit!)
          : docs;
      final comments = limitedComments
          .where((element) => element.metadata.hasPendingWrites)
          .map((comment) {
        final commentEntity = CommentEntityPayload.fromFirestore(comment);
        return commentEntity.toDomain();
      });
      return right(comments);
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Future<Either<CloudStorageFailure, Unit>> deleteUserPost({
    required String postID,
  }) async {
    try {
      await _deleteAllDocument(
        postID: postID,
        inCollection: Constants.comments,
      );

      await _deleteAllDocument(
        postID: postID,
        inCollection: Constants.likes,
      );

      final postInCollection = await FirebaseFirestore.instance
          .collection(Constants.posts)
          .where(
            Constants.postID,
            isEqualTo: postID,
          )
          .limit(1)
          .get();

      for (final post in postInCollection.docs) {
        await post.reference.delete();
      }
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  @override
  Future<Either<CloudStorageFailure, PostCommentsEntity>> getUserPostDetails(
      {required PostDetailsEntity postDetailsEntity}) async {
    try {
      PostEntity? postEntity;
      Iterable<CommentEntity>? commentEntityList;
      final postDoc = await FirebaseFirestore.instance
          .collection(Constants.posts)
          .where(FieldPath.documentId, isEqualTo: postDetailsEntity.postID)
          .limit(1)
          .get();

      final docs = postDoc.docs;
      final areDocsHavePendingWrites = docs.first.metadata.hasPendingWrites;
      if (docs.isEmpty || areDocsHavePendingWrites) {
        postEntity = null;
        commentEntityList = null;
      } else {
        final postEntityDTO = PostEntityPayload.fromJson(docs.first.data());
        postEntity = postEntityDTO.toDomain();

        final commentsCollection =
            FirebaseFirestore.instance.collection(Constants.comments);
        final snapshot = await commentsCollection.count().get();
        if (snapshot.count != 0) {
          final commentsDocs = commentsCollection
              .where(
                Constants.postID,
                isEqualTo: postDetailsEntity.postID,
              )
              .orderBy(
                Constants.createdAt,
                descending: true,
              );
          final limitedComments = postDetailsEntity.limit != null
              ? commentsDocs.limit(postDetailsEntity.limit!)
              : commentsDocs;
          print(limitedComments);
          final doesPostHaveComments =
              await limitedComments.count().get(); // .parameters.length;
          print(doesPostHaveComments);

          if (doesPostHaveComments != 0) {
            final comments = await limitedComments.get();
            commentEntityList = comments.docs.map((comment) {
              final commentEntity = CommentEntityPayload.fromFirestore(comment);
              return commentEntity.toDomain();
            });
          }
        }
        print(snapshot);
      }
      return (right(
        PostCommentsEntity(
          postEntity: postEntity ?? PostEntity.empty(),
          commentEntityList: commentEntityList ?? const Iterable.empty(),
        ),
      ));
    } on FirebaseException catch (e) {
      if (e.message!.contains('object-not-found')) {
        return left(const CloudStorageFailure.objectNotFound());
      } else if (e.message!.contains('unauthorized')) {
        return left(const CloudStorageFailure.unauthorized());
      } else if (e.message!.contains('canceled')) {
        return left(const CloudStorageFailure.cancelledByUser());
      } else {
        return left(const CloudStorageFailure.unknown());
      }
    }
  }

  Future<void> _deleteAllDocument({
    required String postID,
    required String inCollection,
  }) {
    return FirebaseFirestore.instance.runTransaction(
        maxAttempts: 3,
        timeout: const Duration(seconds: 20), (transaction) async {
      final query = await FirebaseFirestore.instance
          .collection(inCollection)
          .where(
            Constants.postID,
            isEqualTo: postID,
          )
          .get();

      for (final doc in query.docs) {
        transaction.delete(doc.reference);
      }
    });
  }
}
