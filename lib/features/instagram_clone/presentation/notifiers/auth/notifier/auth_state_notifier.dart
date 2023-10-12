import 'package:dartz/dartz.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/auth_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firebase_auth_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/state/auth_state.dart';
import 'package:riverpod/riverpod.dart';


class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthService _authService = FirebaseAuthProvider();
  AuthStateNotifier() : super(AuthState.unknown()) {
    final userEntity = _authService.currentUser.fold(
      () => null,
      (a) => a,
    );

    if (userEntity?.userID.getOrCrash() != null) {
      state = AuthState(
        authFailureOrSuccessOption: some(right(unit)),
        isSubmitting: false,
        userUniqueID: userEntity?.userID,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authService.logOut();
    state = AuthState.unknown();
  }

  Future<void> signInWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authService.signInWithGoogle();
    //print(result);
    final userEntity = _authService.currentUser.fold(
      () => null,
      (a) => a,
    );
    /*
    if (result == right(unit) && userEntity?.userID != null) {
      await _firestoreService.saveUserData(userAuthEntity: userEntity!);
    }
    */
    state = AuthState(
      authFailureOrSuccessOption: some(result),
      isSubmitting: false,
      userUniqueID: userEntity?.userID,
    );
  }

  Future<void> signInWithFacebook() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authService.signInWithFacebook();
    final userEntity = _authService.currentUser.fold(
      () => null,
      (a) => a,
    );
    /*
    if (result == right(unit) && userEntity?.userID != null) {
      await _firestoreService.saveUserData(userAuthEntity: userEntity!);
    }
    */
    state = AuthState(
      authFailureOrSuccessOption: some(result),
      isSubmitting: false,
      userUniqueID: userEntity?.userID,
    );
  }
}
