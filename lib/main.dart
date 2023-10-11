import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injectable/injectable.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/themes/size_config.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/is_logged_in_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/user_id_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/comment/providers/is_sending_or_deleting_comment_loading_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/auth/sign_in_page.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/home_page.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/saving_page.dart';
import 'core/router/app_router.dart';
import 'firebase_options.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureInjection(Environment.prod);
  runApp(ProviderScope(child: MainAppWidget()));
}

class MainAppWidget extends StatelessWidget {
  final _appRouter = AppRouter();
  MainAppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp.router(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.blueGrey,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      //theme: themeApp,
    );
  }
}

@RoutePage()
class MainPage extends ConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final userID = ref.watch(userIDProvider);

    if (isLoggedIn == some(right(unit)) && userID != null) {
      //context.pushRoute(const HomeRoute());
      return const HomePage();
      /*
    } else if (isLoggedIn == some(right(unit)) || isLoggedIn == none()) {
      return const SignInPage();
      */
    } else {
      return const SignInPage();
    }
  }
}
