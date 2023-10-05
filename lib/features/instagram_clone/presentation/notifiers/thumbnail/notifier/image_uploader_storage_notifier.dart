import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:image/image.dart' as img;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/core/extensions/get_image_data_aspect_ratio.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/failures/storage_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/storage_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firebase_storage_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/state/image_uploader_storage_state.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ImageUploaderStorageNotifier
    extends StateNotifier<ImageUploaderStorageState> {
  final StorageService storageService = FirebaseStorageProvider();
  ImageUploaderStorageNotifier() : super(ImageUploaderStorageState.unknown());
  Future<void> uploadToStorage({
    required File fileName,
    required ImageOrVideo imageOrVideo,
    required UniqueId userID,
  }) async {
    state = state.copiedWithIsLoading(true);
    late Either<StorageFailure, Uint8List> thumbnailUint8List;
    switch (imageOrVideo) {
      case ImageOrVideo.image:
        thumbnailUint8List = uploadImage(fileName);
        break;
      case ImageOrVideo.video:
        thumbnailUint8List = await uploadVideo(fileName);
        break;
    }
    thumbnailUint8List.fold((failureLoadingImage) {
      state = ImageUploaderStorageState(
        authFailureOrSuccessOption: optionOf(left(failureLoadingImage)),
        thumbnailAspectRatio: 0.0,
        isSubmitting: false,
      );
    }, (thumbnailUint8List) async {
      final thumbnailAspectRatio = await thumbnailUint8List
          .getAspectRatio()
          .then((aspectRatio) => aspectRatio);
      // file url creation
      final thumbnailFileUID = const Uuid().v4();

      final result = await storageService.savePostThumbnail(
        userID: userID,
        thumbnailFileUID: thumbnailFileUID,
        imageOrVideo: imageOrVideo,
        thumbnailUint8List: thumbnailUint8List,
        fileName: fileName,
      );
      state = ImageUploaderStorageState(
        authFailureOrSuccessOption: optionOf(result),
        thumbnailAspectRatio: thumbnailAspectRatio,
        isSubmitting: false,
      );
    });
  }
}

Either<StorageFailure, Uint8List> uploadImage(File fileName) {
  final readFile = fileName.readAsBytesSync();
  final image = img.decodeImage(readFile);

  if (image == null) {
    return left(const StorageFailure.thumbnailNotAbleToBuild());
  }
  final thumbnail = img.copyResize(image, width: Constants.imageThumbnailWidth);
  final thumbnailData = img.encodeJpg(thumbnail);
  return right(Uint8List.fromList(thumbnailData));
}

Future<Either<StorageFailure, Uint8List>> uploadVideo(File fileName) async {
  final thumb = await VideoThumbnail.thumbnailData(
      video: fileName.path,
      imageFormat: ImageFormat.JPEG,
      maxHeight: Constants.videoThumbnailMaxHeight,
      quality: Constants.videoThumbnailQuality);
  if (thumb == null) {
    return left(const StorageFailure.thumbnailNotAbleToBuild());
  } else {
    return right(Uint8List.fromList(thumb));
  }
}
