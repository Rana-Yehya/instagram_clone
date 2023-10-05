import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/failures/storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/thumbnail/thumbnail_storage_payload.dart';

abstract class StorageService {
  Future<Either<StorageFailure, Unit>> deletePostThumbnail({
    required PostEntity postEntity,
  });
  Future<Either<StorageFailure, ThumbnailStoragePayload>> savePostThumbnail({
    required UniqueId userID,
    required String thumbnailFileUID,
    required ImageOrVideo imageOrVideo,
    required Uint8List thumbnailUint8List,
    required File fileName,
  });

  String refName({required Reference ref});
  /*
  Future<bool> saveUserPost({
    required String postID,
    required PostEntity postEntity,
  });
  */
}
