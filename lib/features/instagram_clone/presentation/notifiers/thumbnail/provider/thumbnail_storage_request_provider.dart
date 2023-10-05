import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/thumbnail/thumbnail_storage_payload.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/provider/image_uploader_storage_provider.dart';

final thumbnailStorageRequestProvider =
    Provider<ThumbnailStoragePayload?>((ref) {
  final provider =
      ref.watch(imageUploaderStorageProvider).authFailureOrSuccessOption;
  final result = provider.fold(
    () => null,
    (value) => value.fold(
      (failure) => null,
      (thumbnailStoragePayload) => thumbnailStoragePayload,
    ),
  );
  return result;
});
