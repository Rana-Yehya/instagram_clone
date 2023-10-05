import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
part 'comment_entity.freezed.dart';

@freezed
abstract class CommentEntity implements _$CommentEntity {
  const factory CommentEntity({
    required String commentID,
    required String comment,
    required DateTime? createdAt,
    required UniqueId userID,
    required String postID,
  }) = _CommentEntity;
}
