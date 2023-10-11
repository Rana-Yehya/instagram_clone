import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';

final postCommentsProvider = StreamProvider.family
    .autoDispose<Iterable<CommentEntity>, PostDetailsEntity>(
        (ref, PostDetailsEntity postDetailsEntity) {
  final controller = StreamController<Iterable<CommentEntity>>();
  final FirestoreService firestoreService = FirebaseFirestoreProvider();
  final result =
      firestoreService.getUserPostComment(postDetailsEntity: postDetailsEntity);

  result.fold(
    (failure) => null,
    (value) => controller.addStream(value),
  );

  ref.onDispose(() {
    controller.close();
  });
  return controller.stream;
});
