import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/likes/likes_entity.dart';
import 'package:instagram_clone/features/instagram_clone/infrastructure/models/server_timestamp_converter.dart';
part 'likes_entity_payload.freezed.dart';
part 'likes_entity_payload.g.dart';

@freezed
abstract class LikesEntityPayload implements _$LikesEntityPayload {
  const LikesEntityPayload._();
  const factory LikesEntityPayload({
    @JsonKey(name: Constants.postID) required String postID,
    @JsonKey(name: Constants.userID) required String userID,
    @JsonKey(name: Constants.createdAt)
    @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson,
    )
    required Object createdAt,
  }) = _LikesEntityPayload;

  factory LikesEntityPayload.fromDomain(LikesEntity likesEntity) =>
      LikesEntityPayload(
        postID: likesEntity.postID,
        userID: likesEntity.likedBy.getOrCrash(),
        createdAt: FieldValue.serverTimestamp(),
      );

  LikesEntity toDomain() {
    return LikesEntity(
      postID: postID,
      likedBy: UniqueId.fromUnique(userID),
    );
  }

  factory LikesEntityPayload.fromJson(Map<String, dynamic> json) =>
      _$LikesEntityPayloadFromJson(json);

  factory LikesEntityPayload.fromFirestore(DocumentSnapshot doc) {
    return LikesEntityPayload.fromJson(doc.data()! as Map<String, dynamic>)
        .copyWith(postID: doc.id);
  }
}
