import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/tabs/user_info_view.dart';

@RoutePage()
class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserInfoView();
  }
}
