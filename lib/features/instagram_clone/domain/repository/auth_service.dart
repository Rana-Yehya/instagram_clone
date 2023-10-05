import 'package:dartz/dartz.dart';

import '../entities/auth/data/user_auth_entity.dart';
import '../entities/auth/failures/auth_failure.dart';

abstract class AuthService {
  Future<Either<AuthFailure, Unit>> signInWithFacebook();
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Option<UserAuthEntity> get currentUser;

  Future<void> logOut();
  /*

  @override
  Future<void> passwordReset({required String email}) => provider.passwordReset(
        email: email,
      );

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
  */
}
