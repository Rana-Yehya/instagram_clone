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
          (doc) => PostEntityPayload.fromJson(doc.data()),
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
      await FirebaseFirestore.instance
          .collection(Constants.posts)
          .doc(postDTO.postID)
          .set(postDTO.toJson());
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
        // TODO: Check this
        await FirebaseFirestore.instance
            .collection(Constants.likes)
            .add(likesEntityDTO.toJson());

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
  Either<CloudStorageFailure, Stream<int>> getUserPostLikes(
      {required String postID}) {
    StreamController<int> controller = StreamController<int>();
    try {
      FirebaseFirestore.instance
          .collection(Constants.likes)
          .where(
            Constants.postID,
            isEqualTo: postID,
          )
          .snapshots()
          .listen((snapshot) {
        controller.sink.add(snapshot.docs.length);
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
          .collection(Constants.comment)
          .doc(commentPayload.commentID)
          .set(commentPayload.toJson());
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
      final document = await FirebaseFirestore.instance
          .collection(Constants.comment)
          .where(FieldPath.documentId, isEqualTo: commentID)
          .limit(1)
          .get();

      for (final doc in document.docs) {
        await doc.reference.delete();
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
  Either<CloudStorageFailure, Stream<Iterable<CommentEntity>>>
      getUserPostComment({
    required PostDetailsEntity postDetailsEntity,
  }) {
    try {
      StreamController<Iterable<CommentEntity>> controller =
          StreamController<Iterable<CommentEntity>>();
      FirebaseFirestore.instance
          .collection(Constants.comment)
          .where(Constants.postID, isEqualTo: postDetailsEntity.postID)
          .snapshots()
          .listen((snapshot) {
        final docs = snapshot.docs;
        final limitedComments = postDetailsEntity.limit != null
            ? docs.take(postDetailsEntity.limit!)
            : docs;
        final comments = limitedComments
            .where((element) => !element.metadata.hasPendingWrites)
            .map((comment) {
          final commentEntity = CommentEntityPayload.fromJson(comment.data());
          return commentEntity.toDomain();
        });
        controller.sink.add(comments);
      });
      /*
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
      */
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
  Future<Either<CloudStorageFailure, Unit>> deleteUserPost({
    required String postID,
  }) async {
    try {
      await _deleteAllDocument(
        postID: postID,
        inCollection: Constants.comment,
      );

      await _deleteAllDocument(
        postID: postID,
        inCollection: Constants.likes,
      );

      final postInCollections = await FirebaseFirestore.instance
          .collection(Constants.posts)
          .where(FieldPath.documentId, isEqualTo: postID)
          .limit(1)
          .get();

      for (final doc in postInCollections.docs) {
        await doc.reference.delete();
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
            FirebaseFirestore.instance.collection(Constants.comment);
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
              ? (snapshot.count >= postDetailsEntity.limit!
                  ? commentsDocs.limit(postDetailsEntity.limit!)
                  : commentsDocs)
              : commentsDocs;
          final comments = await limitedComments.get();
          commentEntityList = comments.docs.map((comment) {
            final commentEntity = CommentEntityPayload.fromJson(comment.data());
            return commentEntity.toDomain();
          });
        }
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
      timeout: const Duration(
        seconds: 100,
      ),
      (transaction) async {
        final query = await FirebaseFirestore.instance
            .collection(inCollection)
            .where(Constants.postID, isEqualTo: postID)
            .get();
        for (final doc in query.docs) {
          transaction.delete(doc.reference);
        }
      },
    );
  }
}
