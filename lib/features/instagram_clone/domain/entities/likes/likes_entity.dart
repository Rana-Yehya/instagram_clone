import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
part 'likes_entity.freezed.dart';

@freezed
abstract class LikesEntity implements _$LikesEntity {
  const factory LikesEntity({
    required String postID,
    required UniqueId likedBy,
  }) = _LikesEntity;
}
