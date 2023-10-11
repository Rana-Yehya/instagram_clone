import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';

final allPostsProvider = StreamProvider.autoDispose<
    Either<CloudStorageFailure, Iterable<PostEntity>>>((ref) {
  final controller =
      StreamController<Either<CloudStorageFailure, Iterable<PostEntity>>>();
  final FirestoreService firestoreService = FirebaseFirestoreProvider();

  firestoreService.getAllPosts().then((value) {
    value.fold(
      (failure) => controller.add(left(failure)),
      (postEntity) => controller.add(right(postEntity)),
    );
  });

  ref.onDispose(() {
    controller.close();
  });
  return controller.stream;
});
