import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/data/user_auth_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/failures/auth_failure.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/auth_service.dart';

@LazySingleton(as: AuthService)
class FirebaseAuthProvider implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  FirebaseAuthProvider();

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      final userAuthentication = await user.authentication;
      AuthCredential userCredential = GoogleAuthProvider.credential(
        accessToken: userAuthentication.accessToken,
        idToken: userAuthentication.idToken,
      );
      return _firebaseAuth
          .signInWithCredential(userCredential)
          .then((r) => right(unit));
    } on FirebaseAuthException catch (e) {
      final email = e.email;
      final credential = e.credential;
      if (e.code == 'account-exists-with-different-credential' &&
          email != null &&
          credential != null) {
        //return left(const AuthFailure.invalidEmailAndPasswordCombination());
        return left(const AuthFailure.emailAlreadyInUse());
      } else if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithFacebook() async {
    try {
      final user = await _facebookAuth.login();
      if (user.accessToken == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      final userCredentials =
          FacebookAuthProvider.credential(user.accessToken!.token);
      return _firebaseAuth
          .signInWithCredential(userCredentials)
          .then((r) => right(unit));
    } on FirebaseAuthException catch (e) {
      final email = e.email;
      final credential = e.credential;
      if (e.code == 'account-exists-with-different-credential' &&
          email != null &&
          credential != null) {
        //return left(const AuthFailure.invalidEmailAndPasswordCombination());
        return left(const AuthFailure.emailAlreadyInUse());
      } else if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Option<UserAuthEntity> get currentUser {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return some(UserAuthEntity(
        userID: UniqueId.fromUnique(user.uid),
        email: user.email,
        displayName: user.displayName,
      ));
    } else {
      return none();
    }
  }

  @override
  Future<void> logOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
        _facebookAuth.logOut(),
      ]);
}
