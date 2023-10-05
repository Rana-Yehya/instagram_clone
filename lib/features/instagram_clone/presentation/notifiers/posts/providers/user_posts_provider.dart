import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';

final userPostsProvider = StreamProvider.autoDispose<
    Either<CloudStorageFailure, Iterable<PostEntity>>>((ref) {
  final controller =
      StreamController<Either<CloudStorageFailure, Iterable<PostEntity>>>();
  final FirestoreService firestoreService = FirebaseFirestoreProvider();
  final userID = ref.watch(userIDProvider);

  if (userID?.getOrCrash() != null) {
    firestoreService.getUserPosts(userID: userID!).then((value) {
      value.fold(
        (failure) => controller.add(left(failure)),
        (userAuthEntity) => controller.add(right(userAuthEntity)),
      );
    });
  }

  ref.onDispose(() {
    controller.close();
  });
  return controller.stream;
});
