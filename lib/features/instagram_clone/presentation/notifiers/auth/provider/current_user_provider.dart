import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/data/user_auth_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/failures/auth_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/auth_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firebase_auth_provider.dart';

final currentUserProvider =
    FutureProvider<Either<AuthFailure, UserAuthEntity>>((ref) {
  final AuthService authService = FirebaseAuthProvider();

  final user = authService.currentUser;
  final Either<AuthFailure, UserAuthEntity> result = user.fold(() {
    return left(const AuthFailure.serverError());
  }, (userAuthEntity) {
    return right(userAuthEntity);
  });
  return result;
  //return left(const AuthFailure.serverError());
});
