import 'dart:collection';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_settings.dart';

class PostSettingsNotifier extends StateNotifier<Map<PostSetting, bool>> {
  PostSettingsNotifier()
      : super(UnmodifiableMapView(
          {
            for (final setting in PostSetting.values) setting: true,
          },
        ));

  void setSetting(
    PostSetting setting,
    bool value,
  ) {
    final previousValue = state[setting];
    if (previousValue == null || previousValue == value) {
      return;
    }
    state = Map.unmodifiable(
      Map.from(state)..[setting] = value,
    );
  }
}
