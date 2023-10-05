import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/likes/likes_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';

final hasLikedPostProvider = StreamProvider.family
    .autoDispose<Either<CloudStorageFailure, bool>, String>(
        (ref, String postID) {
  final FirestoreService cloudService = FirebaseFirestoreProvider();
  final controller = StreamController<Either<CloudStorageFailure, bool>>();
  final userID = ref.watch(userIDProvider);
  if (userID == null) {
    return Stream<Either<CloudStorageFailure, bool>>.value(right(false));
  }
/*
Future<Either<CloudStorageFailure, bool>> hasUserLikedPost({
    required LikesEntity likesEntity,
  })
*/
  final likesEntity = LikesEntity(postID: postID, likedBy: userID);
  cloudService
      .hasUserLikedPost(likesEntity: likesEntity)
      .then((value) => controller.sink.add(value));

  ref.onDispose(() {
    controller.close();
  });
  return controller.stream;
});
