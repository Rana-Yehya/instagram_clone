import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/data/user_auth_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/cloud_storage_failures/cloud_storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';

final userInfoProvider = StreamProvider.family
    .autoDispose<Either<CloudStorageFailure, UserAuthEntity>, UniqueId>(
        (ref, UniqueId userID) {
  final FirestoreService firestoreService = FirebaseFirestoreProvider();
  final controller =
      StreamController<Either<CloudStorageFailure, UserAuthEntity>>();

  firestoreService.getUserData(userID: userID).then((value) {
    value.fold(
      (failure) => controller.add(left(failure)),
      (userAuthEntity) => controller.add(right(userAuthEntity)),
    );
  });

  ref.onDispose(() {
    controller.close();
  });

  return controller.stream;
});
