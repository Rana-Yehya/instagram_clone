// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostEntityPayload _$$_PostEntityPayloadFromJson(Map<String, dynamic> json) =>
    _$_PostEntityPayload(
      createdAt: json['created_at'] as Object,
      userID: json['userID'] as String,
      message: json['message'] as String,
      thumbnailURL: json['thumbnail_url'] as String,
      fileURL: json['file_url'] as String,
      imageOrVideo: json['image_or_video'] as bool,
      fileName: json['file_name'] as String,
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
      thumbnailStorageID: json['thumbnail_storage_id'] as String,
      originalFileStorageID: json['original_file_storage_id'] as String,
      postSettings: (json['post_settings'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$PostSettingEnumMap, k), e as bool),
      ),
    );

Map<String, dynamic> _$$_PostEntityPayloadToJson(
        _$_PostEntityPayload instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'userID': instance.userID,
      'message': instance.message,
      'thumbnail_url': instance.thumbnailURL,
      'file_url': instance.fileURL,
      'image_or_video': instance.imageOrVideo,
      'file_name': instance.fileName,
      'aspect_ratio': instance.aspectRatio,
      'thumbnail_storage_id': instance.thumbnailStorageID,
      'original_file_storage_id': instance.originalFileStorageID,
      'post_settings': instance.postSettings
          .map((k, e) => MapEntry(_$PostSettingEnumMap[k]!, e)),
    };

const _$PostSettingEnumMap = {
  PostSetting.allowLikes: 'allowLikes',
  PostSetting.allowComments: 'allowComments',
};
