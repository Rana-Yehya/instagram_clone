import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/failures/storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/storage_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/thumbnail/thumbnail_storage_payload.dart';

@LazySingleton(as: StorageService)
class FirebaseStorageProvider extends StorageService {
  FirebaseStorageProvider();

  @override
  Future<Either<StorageFailure, Unit>> deletePostThumbnail({
    required PostEntity postEntity,
  }) async {
    try {
      await FirebaseStorage.instance
          .ref()
          .child(postEntity.userID.getOrCrash())
          .child(Constants.thumbnails)
          .child(postEntity.thumbnailStorageID)
          .delete();
      await FirebaseStorage.instance
          .ref()
          .child(postEntity.userID.getOrCrash())
          .child(postEntity.imageOrVideo == ImageOrVideo.image
              ? 'images'
              : 'videos')
          .child(postEntity.originalFileStorageID)
          .delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION-DEINED')) {
        return left(const StorageFailure.permissionDenied());
      } else if (e.message!.contains('object-not-found')) {
        return left(const StorageFailure.postNotFound());
      } else {
        return left(const StorageFailure.unexpectedFailure());
      }
    }
  }

  @override
  String refName({required Reference ref}) {
    return ref.name;
  }

  @override
  Future<Either<StorageFailure, ThumbnailStoragePayload>> savePostThumbnail({
    required UniqueId userID,
    required String thumbnailFileUID,
    required ImageOrVideo imageOrVideo,
    required Uint8List thumbnailUint8List,
    required File fileName,
  }) async {
    try {
      final thumbnailRef = FirebaseStorage.instance
          .ref()
          .child(userID.getOrCrash())
          .child(Constants.thumbnails)
          .child(thumbnailFileUID);

      final originalFileRef = FirebaseStorage.instance
          .ref()
          .child(userID.getOrCrash())
          .child(imageOrVideo == ImageOrVideo.image ? 'images' : 'videos')
          .child(thumbnailFileUID);

      final thumbUploadTask = await thumbnailRef.putData(thumbnailUint8List);

      final originalFileUploadTask = await originalFileRef.putFile(fileName);

      return right(ThumbnailStoragePayload(
        thumbStorageID: thumbUploadTask.ref.name,
        originalFileStorageID: originalFileUploadTask.ref.name, 
        thumbnailURLRef: await thumbnailRef.getDownloadURL(), 
        originalFileURLRef: await originalFileRef.getDownloadURL(), 
        
      ));
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION-DEINED')) {
        return left(const StorageFailure.permissionDenied());
      } else if (e.message!.contains('object-not-found')) {
        return left(const StorageFailure.postNotFound());
      } else {
        return left(const StorageFailure.unexpectedFailure());
      }
    }
  }
}
