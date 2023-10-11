import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/is_deleting_post_loading_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/post_details/post_details_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/saving_page.dart';

@RoutePage()
class PostDetailsPage extends HookWidget {
  final PostEntity postEntity;
  const PostDetailsPage({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    var isSaving = useState(false);
    return Consumer(
      builder: (context, ref, child) {
        // install the loading screen
        ref.listen<bool?>(isDeletingPostLoadingProvider, (_, next) {
          if (next == true) {
            isSaving.value = true;
          } else {
            isSaving.value = false;
          }
        });

        return Stack(
          children: [
            PostDetailsView(
              postEntity: postEntity,
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
