import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_settings.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/thumbnail/thumbnail_request.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/post_settings_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/provider/image_uploader_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/provider/image_uploader_storage_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/provider/thumbnail_storage_request_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/create_new_post/file_thumbnail_view.dart';

class CreateNewPostView extends StatefulHookConsumerWidget {
  final File fileName;
  final ImageOrVideo imageOrVideo;

  const CreateNewPostView({
    super.key,
    required this.fileName,
    required this.imageOrVideo,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateNewPostViewState();
}

class _CreateNewPostViewState extends ConsumerState<CreateNewPostView> {
  @override
  Widget build(BuildContext context) {
    final thumbnailAspectRatio =
        ref.watch(imageUploaderStorageProvider).thumbnailAspectRatio;
    //final thumbnailStorageRequest = ref.watch(thumbnailStorageRequestProvider);

    final thumbnailRequest = ThumbnailRequest(
      file: widget.fileName,
      imageOrVideo: widget.imageOrVideo,
    );
    final postSettings = ref.watch(postSettingsProvider);
    final postTextController = useTextEditingController();
    final isPostButtonEnabled = useState(false);
    final userID = ref.watch(userIDProvider);
    ref.listen(thumbnailStorageRequestProvider, (
      _,
      thumbnailStorageRequest,
    ) async {
      //print('The counter changed $newValue');
      await ref.read(imageUploaderProvider.notifier).uploadToCloud(
            imageOrVideo: widget.imageOrVideo,
            message: postTextController.text,
            postSettings: postSettings,
            userID: userID!,
            fileName: '',
            thumbnailStorageRequest: thumbnailStorageRequest!,
            thumbnailAspectRatio: thumbnailAspectRatio,
          );
      if (mounted) {
        context.popRoute();
      }
    });

    final thumbnailStorageRequest = ref.watch(thumbnailStorageRequestProvider);

    useEffect(() {
      void listener() {
        isPostButtonEnabled.value = postTextController.text.isNotEmpty;
      }

      postTextController.addListener(listener);
      return () {
        postTextController.removeListener(listener);
      };
    }, [postTextController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.createNewPost),
        actions: [
          IconButton(
            onPressed: isPostButtonEnabled.value
                ? () async {
                    if (userID?.value.toString() == null) {
                      return;
                    }
                    await ref
                        .read(imageUploaderStorageProvider.notifier)
                        .uploadToStorage(
                          fileName: widget.fileName,
                          imageOrVideo: widget.imageOrVideo,
                          userID: userID!,
                        );
                  }
                : null,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FileThumbnailView(thumbnailRequest: thumbnailRequest),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: Constants.pleaseWriteYourMessageHere,
                  ),
                  autofocus: true,
                  maxLines: null,
                  controller: postTextController,
                ),
              ),
              ...PostSetting.values.map(
                (postSetting) => ListTile(
                  title: Text(postSetting.title),
                  subtitle: Text(postSetting.description),
                  trailing: Switch(
                    value: postSettings[postSetting] ?? false,
                    onChanged: (value) {
                      ref
                          .read(postSettingsProvider.notifier)
                          .setSetting(postSetting, value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveData(
    postTextController,
    thumbnailAspectRatio,
    postSettings,
  ) async {
    final userID = ref.read(userIDProvider);
    if (userID?.value.toString() == null) {
      return;
    }
    final message = postTextController.text;
    await ref.read(imageUploaderStorageProvider.notifier).uploadToStorage(
          fileName: widget.fileName,
          imageOrVideo: widget.imageOrVideo,
          userID: userID!,
        );
    final thumbnailStorageRequest = ref.read(thumbnailStorageRequestProvider);

    if (thumbnailStorageRequest != null) {
      await ref.read(imageUploaderProvider.notifier).uploadToCloud(
            imageOrVideo: widget.imageOrVideo,
            message: message,
            postSettings: postSettings,
            userID: userID,
            fileName: '',
            thumbnailStorageRequest: thumbnailStorageRequest,
            thumbnailAspectRatio: thumbnailAspectRatio,
          );
    }
    if (mounted) {
      context.popRoute();
    }
  }
}
