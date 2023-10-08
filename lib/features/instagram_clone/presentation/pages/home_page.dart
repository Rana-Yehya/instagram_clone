import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/router/app_router.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/helpers/image_picker_helper.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/posts/providers/post_settings_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/animation/empty_content_with_text_animation.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/tabs/user_info_view.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.appName),
          actions: [
            IconButton(
              onPressed: () async {
                final videoFile =
                    await ImagePickerHelper.pickVideoFromGallery();
                if (videoFile == null) {
                  return;
                }
                ref.refresh(postSettingsProvider);
                if (!mounted) {
                  return;
                }
                context.pushRoute(CreateNewPostRoute(
                  fileName: videoFile,
                  imageOrVideo: ImageOrVideo.video,
                ));
              },
              icon: const FaIcon(FontAwesomeIcons.video),
            ),
            IconButton(
              onPressed: () async {
                final imageFile =
                    await ImagePickerHelper.pickImageFromGallery();
                if (imageFile == null) {
                  return;
                }
                ref.refresh(postSettingsProvider);
                if (!mounted) {
                  return;
                }
                context.pushRoute(CreateNewPostRoute(
                  fileName: imageFile,
                  imageOrVideo: ImageOrVideo.image,
                ));
              },
              icon: const Icon(Icons.add_photo_alternate_outlined),
            ),
            IconButton(
              onPressed: () async {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.question,
                  title: Constants.logOut,
                  desc: Constants.areYouSureThatYouWantToLogOutOfTheApp,
                  btnOkText: "Yes",
                  btnOkOnPress: () async {
                    await ref.read(authStateProvider.notifier).logOut();
                  },
                  btnCancelText: 'No',
                  btnCancelOnPress: () {
                    context.popRoute();
                  },
                ).show();
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                icon: Icon(Icons.home),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const UserInfoView(),
            const EmptyContentWithTextAnimation(text: Constants.youHaveNoPosts),
            Container(color: Colors.brown),
          ],
        ),
      ),
    );
  }
}
