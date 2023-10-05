import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/extensions/get_image_aspect_ratio.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/thumbnail/image_with_aspect_ratio.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/thumbnail/thumbnail_request.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/failures/storage_failure.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

final thumbnailProvider =
    FutureProvider.family.autoDispose<ImageWithAspectRatio, ThumbnailRequest>(
  (
    ref,
    ThumbnailRequest request,
  ) async {
    final Image image;

    switch (request.imageOrVideo) {
      case ImageOrVideo.image:
        image = Image.file(
          request.file,
          fit: BoxFit.fitHeight,
        );
        break;
      case ImageOrVideo.video:
        final thumb = await VideoThumbnail.thumbnailData(
          video: request.file.path,
          imageFormat: ImageFormat.JPEG,
          quality: Constants.videoThumbnailQuality,
        );

        if (thumb == null) {
          throw const StorageFailure.thumbnailNotAbleToBuild();
        }
        image = Image.memory(
          thumb,
          fit: BoxFit.fitHeight,
        );
        break;
    }

    final aspectRatio = await image.getImageAspectRatio();
    return ImageWithAspectRatio(image: image, aspectRatio: aspectRatio);
  },
);
