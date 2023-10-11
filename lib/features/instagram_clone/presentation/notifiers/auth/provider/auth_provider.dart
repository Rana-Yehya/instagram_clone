import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/notifier/auth_state_notifier.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/state/auth_state.dart';
import 'package:riverpod/riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);




