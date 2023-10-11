import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';

final postsBySearchTermProvider = StreamProvider.family
    .autoDispose<Iterable<PostEntity>, String>((ref, String searchTerm) {
  final FirestoreService firestoreService = FirebaseFirestoreProvider();
  final controller = StreamController<Iterable<PostEntity>>();
  final result = firestoreService.getPostsBySearchTerm(searchTerm: searchTerm);

  result.fold(
    (cloudStorageFailure) => controller.sink.add(const Iterable.empty()),
    (postEntityList) => controller.sink.addStream(postEntityList),
  );

  ref.onDispose(() {
    controller.close();
  });
  return controller.stream;
});
