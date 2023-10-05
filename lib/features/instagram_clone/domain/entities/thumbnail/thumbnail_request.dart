import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
part 'thumbnail_request.freezed.dart';

@freezed
abstract class ThumbnailRequest implements _$ThumbnailRequest {
  const ThumbnailRequest._();
  const factory ThumbnailRequest({
    required File file,
    required ImageOrVideo imageOrVideo,
  }) = _ThumbnailRequest;
}
