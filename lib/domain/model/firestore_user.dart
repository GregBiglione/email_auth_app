import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_user.freezed.dart';
part 'firestore_user.g.dart';

@freezed
class FireStoreUser with _$FireStoreUser {
  const factory FireStoreUser({
    @Default("") String uid,
    @Default("") String username,
  }) = _FireStoreUser;

  factory FireStoreUser.fromJson(Map<String, dynamic> json) =>
      _$FireStoreUserFromJson(json);
}