import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';

final postLikesCountProvider =
    StreamProvider.family.autoDispose<int, String>((ref, String postID) {
  final FirestoreService cloudService = FirebaseFirestoreProvider();
  final controller = StreamController<int>.broadcast();

  cloudService
      .getUserPostLikes(
        postID: postID,
      )
      .then((result) => result.fold(
            (_) => controller.sink.add(0),
            (value) => controller.sink.add(value),
          ));

  ref.onDispose(() {
    controller.close();
  });

  return controller.stream;
});
