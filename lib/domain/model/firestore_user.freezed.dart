// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firestore_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FireStoreUser _$FireStoreUserFromJson(Map<String, dynamic> json) {
  return _FireStoreUser.fromJson(json);
}

/// @nodoc
mixin _$FireStoreUser {
  String get uid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FireStoreUserCopyWith<FireStoreUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FireStoreUserCopyWith<$Res> {
  factory $FireStoreUserCopyWith(
          FireStoreUser value, $Res Function(FireStoreUser) then) =
      _$FireStoreUserCopyWithImpl<$Res, FireStoreUser>;
  @useResult
  $Res call({String uid, String username});
}

/// @nodoc
class _$FireStoreUserCopyWithImpl<$Res, $Val extends FireStoreUser>
    implements $FireStoreUserCopyWith<$Res> {
  _$FireStoreUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FireStoreUserImplCopyWith<$Res>
    implements $FireStoreUserCopyWith<$Res> {
  factory _$$FireStoreUserImplCopyWith(
          _$FireStoreUserImpl value, $Res Function(_$FireStoreUserImpl) then) =
      __$$FireStoreUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String username});
}

/// @nodoc
class __$$FireStoreUserImplCopyWithImpl<$Res>
    extends _$FireStoreUserCopyWithImpl<$Res, _$FireStoreUserImpl>
    implements _$$FireStoreUserImplCopyWith<$Res> {
  __$$FireStoreUserImplCopyWithImpl(
      _$FireStoreUserImpl _value, $Res Function(_$FireStoreUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
  }) {
    return _then(_$FireStoreUserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FireStoreUserImpl implements _FireStoreUser {
  const _$FireStoreUserImpl({this.uid = "", this.username = ""});

  factory _$FireStoreUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$FireStoreUserImplFromJson(json);

  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String username;

  @override
  String toString() {
    return 'FireStoreUser(uid: $uid, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FireStoreUserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FireStoreUserImplCopyWith<_$FireStoreUserImpl> get copyWith =>
      __$$FireStoreUserImplCopyWithImpl<_$FireStoreUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FireStoreUserImplToJson(
      this,
    );
  }
}

abstract class _FireStoreUser implements FireStoreUser {
  const factory _FireStoreUser({final String uid, final String username}) =
      _$FireStoreUserImpl;

  factory _FireStoreUser.fromJson(Map<String, dynamic> json) =
      _$FireStoreUserImpl.fromJson;

  @override
  String get uid;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$FireStoreUserImplCopyWith<_$FireStoreUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
