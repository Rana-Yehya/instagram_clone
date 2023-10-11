import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/is_login_loading_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/auth/sign_in_view.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/saving_page.dart';

@RoutePage()
class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isSaving = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),

      body: Consumer(
        builder: (context, ref, child) {
          ref.listen<bool?>(isLoginLoadingProvider, (_, next) {
            if (next == true) {
              isSaving.value = true;
            } else {
              isSaving.value = false;
            }
          });

          return Stack(
            children: [
              const SignInView(),
              SavingPage(
                isSaving: isSaving.value,
                text: Constants.loading,
              ),
            ],
          );
        },
      ),
    );
  }
}
