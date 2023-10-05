import 'package:flutter/material.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/tabs/user_info_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        UserInfoView(),
        UserInfoView(),
        UserInfoView(),
      ],
    );
  }
}
