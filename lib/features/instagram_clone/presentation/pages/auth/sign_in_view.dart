import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/themes/app_colors.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_storage_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/current_user_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/widgets/custom_text_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styleText =
        Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.5);
    //final authStorageState = ref.watch(authStorageProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 40,
          ),
          // header text
          Text(
            Constants.welcomeToAppName,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 40),
          const Divider(),
          const SizedBox(height: 40),
          Text(
            Constants.logIntoYourAccount,
            style: styleText,
          ),
          const SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.loginButtonColor,
              foregroundColor: AppColors.loginButtonTextColor,
            ),
            onPressed: () async {
              await ref.read(authStateProvider.notifier).signInWithFacebook();
              final currentUser = ref.watch(currentUserProvider);
              currentUser.whenData(
                (data) {
                  data.fold(
                    (l) => null,
                    (userAuthEntity) => ref
                        .read(authStorageProvider.notifier)
                        .saveUserData(userAuthEntity: userAuthEntity),
                  );
                },
              );
            },
            child: const CustomTextButton(
              icon: FontAwesomeIcons.facebook,
              iconColor: AppColors.facebookColor,
              text: Constants.facebook,
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.loginButtonColor,
              foregroundColor: AppColors.loginButtonTextColor,
            ),
            onPressed: () async {
              await ref.read(authStateProvider.notifier).signInWithGoogle();
              final currentUser = ref.watch(currentUserProvider);
              currentUser.whenData(
                (data) {
                  data.fold(
                    (l) => null,
                    (userAuthEntity) => ref
                        .read(authStorageProvider.notifier)
                        .saveUserData(userAuthEntity: userAuthEntity),
                  );
                },
              );
            },
            child: const CustomTextButton(
              icon: FontAwesomeIcons.google,
              iconColor: AppColors.googleColor,
              text: Constants.google,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 2),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  style: styleText,
                  text: Constants.dontHaveAnAccount,
                ),
                TextSpan(
                  style: styleText,
                  text: Constants.signUpOn,
                ),
                TextSpan(
                  style: styleText?.copyWith(color: AppColors.blueColor),
                  text: Constants.facebook,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                        Uri.parse(
                          Constants.facebookSignupURL,
                        ),
                      );
                    },
                ),
                TextSpan(
                  style: styleText,
                  text: Constants.orCreateAnAccountOn,
                ),
                TextSpan(
                  style: styleText?.copyWith(color: AppColors.blueColor),
                  text: Constants.google,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                        Uri.parse(
                          Constants.googleSignupURL,
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
