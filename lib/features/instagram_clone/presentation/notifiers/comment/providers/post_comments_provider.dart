import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';

final postCommentsProvider = StreamProvider.family.autoDispose<
    Either<CloudStorageFailure, Iterable<CommentEntity>>,
    PostDetailsEntity>((ref, PostDetailsEntity postDetailsEntity) {
  final controller =
      StreamController<Either<CloudStorageFailure, Iterable<CommentEntity>>>();
  final FirestoreService firestoreService = FirebaseFirestoreProvider();
  firestoreService
      .getUserPostComment(postDetailsEntity: postDetailsEntity)
      .then((value) => controller.sink.add(value));

  ref.onDispose(() {
    controller.close();
  });
  return controller.stream;
});
