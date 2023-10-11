import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/notifier/auth_storage_notifier.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/state/auth_storage_state.dart';
import 'package:riverpod/riverpod.dart';

final authStorageProvider =
    StateNotifierProvider<AuthStorageNotifier, AuthStorageState>(
  (_) => AuthStorageNotifier(),
);