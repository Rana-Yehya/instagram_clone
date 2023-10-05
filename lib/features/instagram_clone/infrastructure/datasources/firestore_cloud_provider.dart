import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/data/user_auth_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/auth/user_auth_payload.dart';
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
      FirebaseFirestore.instance
          .collection(Constants.users)
          .where(Constants.userID, isEqualTo: userID.getOrCrash())
          .limit(1)
          .snapshots()
          .listen((snapshot) {
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
}
