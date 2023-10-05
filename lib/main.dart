import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:instagram_clone/core/themes/size_config.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/auth/sign_in_page.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/home_page.dart';
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

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('AwesomeDialg & AnotherFlushBar'),
      ),
      body: TestPage(),
    ));
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      onPressed: () {
        AwesomeDialog(
          context: context,
          title: "Title",
          desc: "Description",
          btnOkText: "OK",
          btnOkOnPress: () {},
        ).show();

        Timer(const Duration(milliseconds: 2000), () async {
          Flushbar(
            titleText: Text("Title"),
            messageText: Text("Body"),
            flushbarPosition: FlushbarPosition.TOP,
            borderColor: Colors.black,
            borderWidth: 2,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.white,
          ).show(context);
        });
      },
      child: Text("BUTTON"),
    ));
  }
}
*/
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
    if (isLoggedIn == some(right(unit)) && userID?.value.toString() != null) {
      //context.pushRoute(const HomeRoute());
      return const HomePage();
    } else if (isLoggedIn == some(right(unit)) || isLoggedIn == none()) {
      return const SignInPage();
    } else {
      /*
      FlushbarHelper.createError(
        message: isLoggedIn.fold(
          () => '',
          (either) => either.fold((f) {
            FlushbarHelper.createError(
              message: f.map(
                  cancelledByUser: (CancelledByUser value) => 'Cancelled',
                  emailAlreadyInUse: (EmailAlreadyInUse value) =>
                      'Email Already In Use',
                  invalidEmailAndPasswordCombination:
                      (InvalidEmailAndPasswordCombination value) =>
                          'Invalid Email And/Or Password',
                  serverError: (ServerError value) => 'Server Error'),
              duration: const Duration(seconds: 3),
            ).show(context);
            return '';
          }, (_) => ''),
        ),
      );
      */
      //context.pushRoute(SignInRoute());
      return const SignInPage();
    }
    /*
        return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
        */
  }
}

/*
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
*/