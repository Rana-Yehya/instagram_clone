import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/entity/unique_id.dart';

part 'user_auth_entity.freezed.dart';

@freezed
class UserAuthEntity with _$UserAuthEntity {
  const UserAuthEntity._();
  const factory UserAuthEntity({
    required UniqueId userID,
    required String? email,
    required String? displayName,
  }) = _UserAuthEntity;
}
