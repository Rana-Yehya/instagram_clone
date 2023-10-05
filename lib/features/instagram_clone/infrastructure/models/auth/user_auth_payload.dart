import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/auth/data/user_auth_entity.dart';
part 'user_auth_payload.freezed.dart';
part 'user_auth_payload.g.dart';

@freezed
abstract class UserAuthPayload implements _$UserAuthPayload {
  const UserAuthPayload._();
  const factory UserAuthPayload({
    //@JsonKey(ignore: true, name: Constants.userID) required String userID,
    //@JsonKey(name: Constants.displayName) required String? displayName,
   // @JsonKey(name: Constants.email) required String? email,
    @JsonKey(name: Constants.userID) required String userID,
    @JsonKey(name: Constants.displayName) required String? displayName,
    @JsonKey(name: Constants.email) required String? email,
  }) = _UserAuthPayload;

  factory UserAuthPayload.fromDomain(UserAuthEntity userAuthEntity) =>
      UserAuthPayload(
        userID: userAuthEntity.userID.getOrCrash(),
        displayName: userAuthEntity.displayName,
        email: userAuthEntity.email,
      );

  UserAuthEntity toDomain() {
    return UserAuthEntity(
      userID: UniqueId.fromUnique(userID),
      displayName: displayName,
      email: email,
    );
  }

  factory UserAuthPayload.fromJson(Map<String, dynamic> json) =>
      _$UserAuthPayloadFromJson(json);

  factory UserAuthPayload.fromFirestore(DocumentSnapshot doc) {
    return UserAuthPayload.fromJson(doc.data()! as Map<String, dynamic>)
        .copyWith(userID: doc.id);
  }
}
