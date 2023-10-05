import 'package:freezed_annotation/freezed_annotation.dart';
part 'cloud_storage_failure.freezed.dart';

@freezed
abstract class CloudStorageFailure with _$CloudStorageFailure {
  const factory CloudStorageFailure.unknown() = Unknown;
  const factory CloudStorageFailure.objectNotFound() = ObjectNotFound;
  const factory CloudStorageFailure.cancelledByUser() = CancelledByUser;
  const factory CloudStorageFailure.unauthorized() = Unauthorized;
}
