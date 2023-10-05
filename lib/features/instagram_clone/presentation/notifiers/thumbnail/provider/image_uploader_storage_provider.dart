import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/notifier/image_uploader_storage_notifier.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/state/image_uploader_storage_state.dart';

final imageUploaderStorageProvider = StateNotifierProvider<
    ImageUploaderStorageNotifier, ImageUploaderStorageState>(
  (ref) => ImageUploaderStorageNotifier(),
);
