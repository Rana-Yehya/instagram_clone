import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/failures/auth_failure.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/auth_provider.dart';

final isLoggedInProvider = Provider<Option<Either<AuthFailure, Unit>>>((ref) {
  return ref.watch(authStateProvider).authFailureOrSuccessOption;
});
