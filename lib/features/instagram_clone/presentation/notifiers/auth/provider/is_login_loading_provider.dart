import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';

final isLoginLoadingProvider = Provider<bool?>((ref) {
  final authState = ref.watch(authStateProvider);

  return authState.isSubmitting;
});
