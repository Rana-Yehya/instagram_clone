import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostDisplayNameAndMessageView extends ConsumerWidget {
  final String displayName;
  final String message;
  const PostDisplayNameAndMessageView({
    super.key,
    required this.displayName,
    required this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: "$displayName: ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: message,
            )
          ],
        ),
      ),
    );
  }
}
