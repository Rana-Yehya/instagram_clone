import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/likes/likes_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/likes/likes_state.dart';

class PostLikesDislikesNotifier extends StateNotifier<LikesState> {
  final FirestoreService cloudService = FirebaseFirestoreProvider();
  PostLikesDislikesNotifier() : super(LikesState.unknown());

  void saveUserOnPostLikesOrDislike({required LikesEntity likesEntity}) async {
    state = state.copiedWithIsLoading(true);

    final result = await cloudService.saveUserOnPostLikesOrDislike(
      likesEntity: likesEntity,
    );
    state = LikesState(
      authFailureOrSuccessOption: some(result),
      isSubmitting: false,
    );
  }
}
