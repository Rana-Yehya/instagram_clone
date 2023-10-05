import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/likes/likes_entity.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/server_timestamp_converter.dart';
part 'likes_entity_payload.freezed.dart';
part 'likes_entity_payload.g.dart';

@freezed
abstract class LikestEntityPayload implements _$LikestEntityPayload {
  const LikestEntityPayload._();
  const factory LikestEntityPayload({
    @JsonKey(name: Constants.postID) required String postID,
    @JsonKey(name: Constants.userID) required String userID,
    @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson,
    )
    required Object createdAt,
  }) = _LikestEntityPayload;

  factory LikestEntityPayload.fromDomain(LikesEntity likesEntity) =>
      LikestEntityPayload(
        postID: likesEntity.postID,
        userID: likesEntity.likedBy.value.toString(),
        createdAt: FieldValue.serverTimestamp(),
      );

  LikesEntity toDomain() {
    return LikesEntity(
      postID: postID,
      likedBy: UniqueId.fromUnique(userID),
    );
  }

  factory LikestEntityPayload.fromJson(Map<String, dynamic> json) =>
      _$LikestEntityPayloadFromJson(json);

  factory LikestEntityPayload.fromFirestore(DocumentSnapshot doc) {
    return LikestEntityPayload.fromJson(doc.data()! as Map<String, dynamic>)
        .copyWith(postID: doc.id);
  }
}
