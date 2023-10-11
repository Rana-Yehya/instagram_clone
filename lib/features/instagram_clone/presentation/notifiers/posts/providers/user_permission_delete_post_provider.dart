import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/notifiers/auth/provider/user_id_provider.dart';

final userPermissionDeletePostProvider = StreamProvider.family
    .autoDispose<bool, PostEntity>((ref, PostEntity postEntity) async* {
  final userID = ref.watch(userIDProvider);
  yield userID == postEntity.userID;
});
