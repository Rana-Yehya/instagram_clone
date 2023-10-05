import 'package:freezed_annotation/freezed_annotation.dart';
part 'storage_failure.freezed.dart';
@freezed
abstract class StorageFailure with _$StorageFailure {
  const factory StorageFailure.unexpectedFailure() = _UnexpectedFailure;
  const factory StorageFailure.permissionDenied() = _PermissionDenied;
  const factory StorageFailure.postNotFound() = _PostNotFound;
  
  // thumbnail request
  const factory StorageFailure.thumbnailNotAbleToBuild() = _ThumbnailNotAbleToBuild;
}
