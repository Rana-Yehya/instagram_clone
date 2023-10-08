import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/likes/likes_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';

final hasUserLikedPostProvider =
    StreamProvider.family.autoDispose<bool, LikesEntity>((
  ref,
  LikesEntity likesEntity,
) {
  final FirestoreService cloudService = FirebaseFirestoreProvider();
  final controller = StreamController<bool>();

  final result = cloudService.hasUserLikedPost(likesEntity: likesEntity);
  result.fold(
    (failure) => controller.sink.add(false),
    (hasLiked) => controller.addStream(hasLiked),
  );

  return controller.stream;
});
