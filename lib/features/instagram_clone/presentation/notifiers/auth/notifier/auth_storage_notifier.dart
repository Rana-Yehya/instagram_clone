import 'package:dartz/dartz.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/data/user_auth_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/state/auth_storage_state.dart';
import 'package:riverpod/riverpod.dart';

class AuthStorageNotifier extends StateNotifier<AuthStorageState> {
  final FirestoreService cloudService = FirebaseFirestoreProvider();
  AuthStorageNotifier() : super(AuthStorageState.unknown());

  void saveUserData({required UserAuthEntity userAuthEntity}) async {
    state = state.copiedWithIsLoading(true);
    final result = await cloudService.saveUserData(
      userAuthEntity: userAuthEntity,
    );
    state = AuthStorageState(
      authFailureOrSuccessOption: some(result),
      isSubmitting: false,
    );
  }
}
