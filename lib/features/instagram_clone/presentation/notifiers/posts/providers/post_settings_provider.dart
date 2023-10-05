import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_settings.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/notifier/post_settings_notifier.dart';

final postSettingsProvider =
    StateNotifierProvider<PostSettingsNotifier, Map<PostSetting, bool>>(
  (ref) => PostSettingsNotifier(),
);
