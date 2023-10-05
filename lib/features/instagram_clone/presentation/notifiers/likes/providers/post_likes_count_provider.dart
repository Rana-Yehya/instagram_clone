import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';

final postLikesCountProvider = StreamProvider.family
    .autoDispose<Either<CloudStorageFailure, int>, String>(
        (ref, String postID) {
  final FirestoreService cloudService = FirebaseFirestoreProvider();
  final controller =
      StreamController<Either<CloudStorageFailure, int>>.broadcast();

  cloudService
      .getUserPostLikes(postID: postID)
      .then((value) => controller.sink.add(value));

  ref.onDispose(() {
    controller.close();
  });

  return controller.stream;
});
