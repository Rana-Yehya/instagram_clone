import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/thumbnail/provider/is_image_uploading_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/create_new_post/create_new_post_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/saving_page.dart';

@RoutePage()
class CreateNewPostPage extends HookWidget {
  final File fileName;
  final ImageOrVideo imageOrVideo;

  const CreateNewPostPage(
      {super.key, required this.fileName, required this.imageOrVideo});

  @override
  Widget build(BuildContext context) {
    var isSaving = useState(false);

    return Consumer(
      builder: (context, ref, child) {
        // install the loading screen
        ref.listen<bool?>(isImageUploadingProvider, (_, next) {
          if (next == true) {
            isSaving.value = true;
          } else {
            isSaving.value = false;
          }
        });

        return Stack(
          children: [
            CreateNewPostView(
              fileName: fileName,
              imageOrVideo: imageOrVideo,
            ),
            SavingPage(
              isSaving: isSaving.value,
              text: Constants.loading,
            ),
          ],
        );
      },
    );
  }
}
