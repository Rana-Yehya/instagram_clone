import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/likes/likes_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/repository/cloud_service.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/datasources/firestore_cloud_provider.dart';

final postLikesDislikesProvider = FutureProvider.family
    .autoDispose<bool, LikesEntity>((ref, LikesEntity likesEntity) async {
  final FirestoreService cloudService = FirebaseFirestoreProvider();
  final result = await cloudService.saveUserOnPostLikesOrDislike(
    likesEntity: likesEntity,
  );

  final value = result.fold(
    (failure) => false,
    (hasLiked) => hasLiked,
  );
  return value;
});
