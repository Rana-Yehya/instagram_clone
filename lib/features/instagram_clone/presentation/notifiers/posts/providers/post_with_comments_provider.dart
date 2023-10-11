import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/extensions/sorting_by_date.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';

final postWithCommentsProvider = StreamProvider.family
    .autoDispose<PostCommentsEntity, PostDetailsEntity>(
        (ref, PostDetailsEntity postDetailsEntity) {
  final FirestoreService firestoreService = FirebaseFirestoreProvider();
  final controller = StreamController<PostCommentsEntity>();
  PostEntity? postEntity;
  Iterable<CommentEntity>? commentEntityList;
  void notify() {
    final post = postEntity;
    if (post == null) {
      return;
    }
    final outputComments = (commentEntityList ?? []).applySorting(
      postDetailsEntity,
    );

    final result = PostCommentsEntity(
      postEntity: post,
      commentEntityList: outputComments,
    );

    controller.sink.add(result);
  }

  firestoreService
      .getUserPostDetails(postDetailsEntity: postDetailsEntity)
      .then((value) {
    value.fold((cloudStorageFailure) => null, (postCommentsEntity) {
      postEntity = postCommentsEntity.postEntity;
      commentEntityList = postCommentsEntity.commentEntityList;
      notify();
    });
  });

  ref.onDispose(() {
    controller.close();
  });
  return controller.stream;
});
