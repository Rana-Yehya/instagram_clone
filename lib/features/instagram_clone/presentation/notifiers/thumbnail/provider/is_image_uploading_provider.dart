import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/provider/image_uploader_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/provider/image_uploader_storage_provider.dart';

final isImageUploadingProvider = Provider<bool?>((ref) {
  final imageUploader = ref.watch(imageUploaderProvider);
  final imageUploaderStorage = ref.watch(imageUploaderStorageProvider);

  return imageUploader.isSubmitting || imageUploaderStorage.isSubmitting;
});
