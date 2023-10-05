import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_settings.dart';
part 'post_entity_payload.freezed.dart';
part 'post_entity_payload.g.dart';

@freezed
abstract class PostEntityPayload implements _$PostEntityPayload {
  const PostEntityPayload._();
  const factory PostEntityPayload({
    @JsonKey(ignore: true, name: Constants.postID) String? postID,
    @JsonKey(name: Constants.createdAt)
    @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson,
    )
    required Object createdAt,
    @JsonKey(name: Constants.userID) required String userID,
    @JsonKey(name: Constants.message) required String message,
    @JsonKey(name: Constants.thumbnailURL) required String thumbnailURL,
    @JsonKey(name: Constants.fileURL) required String fileURL,
    @JsonKey(name: Constants.imageOrVideo) required bool imageOrVideo,
    @JsonKey(name: Constants.fileName) required String fileName,
    @JsonKey(name: Constants.aspectRatio) required double aspectRatio,
    @JsonKey(name: Constants.thumbnailStorageID)
    required String thumbnailStorageID,
    @JsonKey(name: Constants.originalFileStorageID)
    required String originalFileStorageID,
    @JsonKey(name: Constants.postSettings)
    required Map<PostSetting, bool> postSettings,
    //@ServerTimestampConverter() required FieldValue serverTime,
  }) = _PostEntityPayload;

  factory PostEntityPayload.fromDomain(PostEntity postEntity) =>
      PostEntityPayload(
        postID: postEntity.postID,
        userID: postEntity.userID.getOrCrash(),
        message: postEntity.message,
        createdAt: FieldValue.serverTimestamp(),
        thumbnailURL: postEntity.thumbnailURL,
        fileURL: postEntity.fileURL,
        imageOrVideo: postEntity.imageOrVideo.index == 0,
        fileName: postEntity.fileName,
        aspectRatio: postEntity.aspectRatio,
        thumbnailStorageID: postEntity.thumbnailStorageID,
        originalFileStorageID: postEntity.originalFileStorageID,
        postSettings: postEntity.postSettings,
      );

  PostEntity toDomain() {
    //print("result");
    // print(serverTimestampToJson.toString());
    final time = ServerTimestampConverter.fromJson(createdAt);
    //print("time");
    //print(time);
    return PostEntity(
      postID: postID!,
      userID: UniqueId.fromUnique(userID),
      message: message,
      createdAt: time,
      thumbnailURL: thumbnailURL,
      fileURL: fileURL,
      imageOrVideo: imageOrVideo ? ImageOrVideo.image : ImageOrVideo.video,
      fileName: fileName,
      aspectRatio: aspectRatio,
      thumbnailStorageID: thumbnailStorageID,
      originalFileStorageID: originalFileStorageID,
      postSettings: postSettings,
    );
  }

  factory PostEntityPayload.fromJson(Map<String, dynamic> json) =>
      _$PostEntityPayloadFromJson(json);

  factory PostEntityPayload.fromFirestore(DocumentSnapshot doc) {
    return PostEntityPayload.fromJson(doc.data()! as Map<String, dynamic>)
        .copyWith(postID: doc.id);
  }
}

class ServerTimestampConverter {
  static DateTime fromJson(Object json) {
    return (json as Timestamp).toDate();
  }

  static Object toJson(Object fieldValue) {
    return fieldValue as FieldValue;
  }
}
