import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/server_timestamp_converter.dart';

part 'comment_entity_payload.freezed.dart';
part 'comment_entity_payload.g.dart';

@freezed
abstract class CommentEntityPayload implements _$CommentEntityPayload {
  const CommentEntityPayload._();
  const factory CommentEntityPayload({
    @JsonKey(ignore: true, name: Constants.commentID) String? commentID,
    @JsonKey(name: Constants.comment) required String comment,
    @JsonKey(name: Constants.createdAt)
    @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson,
    )
    required Object createdAt,
    @JsonKey(name: Constants.userID) required String userID,
    @JsonKey(name: Constants.postID) required String postID,
  }) = _CommentEntityPayload;

  factory CommentEntityPayload.fromDomain(CommentEntity commentEntity) =>
      CommentEntityPayload(
        commentID: commentEntity.commentID,
        userID: commentEntity.userID.getOrCrash(),
        createdAt: FieldValue.serverTimestamp(),
        comment: commentEntity.comment,
        postID: commentEntity.postID,
      );

  CommentEntity toDomain() {
    return CommentEntity(
      commentID: commentID!,
      comment: comment,
      createdAt: ServerTimestampConverter.fromJson(createdAt),
      userID: UniqueId.fromUnique(userID),
      postID: postID,
    );
  }

  factory CommentEntityPayload.fromJson(Map<String, dynamic> json) =>
      _$CommentEntityPayloadFromJson(json);

  factory CommentEntityPayload.fromFirestore(DocumentSnapshot doc) {
    return CommentEntityPayload.fromJson(doc.data()! as Map<String, dynamic>)
        .copyWith(commentID: doc.id);
  }
}
