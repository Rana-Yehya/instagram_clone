import 'package:dartz/dartz.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/failures/auth_failure.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/notifier/auth_state_notifier.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/state/auth_state.dart';
import 'package:riverpod/riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);

final isLoggedInProvider = Provider<Option<Either<AuthFailure, Unit>>>((ref) {
  return ref.watch(authStateProvider).authFailureOrSuccessOption;
});

final userIDProvider = Provider<UniqueId?>(
  (ref) => ref.watch(authStateProvider).userUniqueID,
);
