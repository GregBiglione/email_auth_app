// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterState _$RegisterStateFromJson(Map<String, dynamic> json) {
  return _RegisterState.fromJson(json);
}

/// @nodoc
mixin _$RegisterState {
  ValidationItem get username => throw _privateConstructorUsedError;
  ValidationItem get email => throw _privateConstructorUsedError;
  ValidationItem get password => throw _privateConstructorUsedError;
  ValidationItem get confirmPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {ValidationItem username,
      ValidationItem email,
      ValidationItem password,
      ValidationItem confirmPassword});

  $ValidationItemCopyWith<$Res> get username;
  $ValidationItemCopyWith<$Res> get email;
  $ValidationItemCopyWith<$Res> get password;
  $ValidationItemCopyWith<$Res> get confirmPassword;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as ValidationItem,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as ValidationItem,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as ValidationItem,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ValidationItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidationItemCopyWith<$Res> get username {
    return $ValidationItemCopyWith<$Res>(_value.username, (value) {
      return _then(_value.copyWith(username: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidationItemCopyWith<$Res> get email {
    return $ValidationItemCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidationItemCopyWith<$Res> get password {
    return $ValidationItemCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidationItemCopyWith<$Res> get confirmPassword {
    return $ValidationItemCopyWith<$Res>(_value.confirmPassword, (value) {
      return _then(_value.copyWith(confirmPassword: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterStateImplCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$RegisterStateImplCopyWith(
          _$RegisterStateImpl value, $Res Function(_$RegisterStateImpl) then) =
      __$$RegisterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ValidationItem username,
      ValidationItem email,
      ValidationItem password,
      ValidationItem confirmPassword});

  @override
  $ValidationItemCopyWith<$Res> get username;
  @override
  $ValidationItemCopyWith<$Res> get email;
  @override
  $ValidationItemCopyWith<$Res> get password;
  @override
  $ValidationItemCopyWith<$Res> get confirmPassword;
}

/// @nodoc
class __$$RegisterStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateImpl>
    implements _$$RegisterStateImplCopyWith<$Res> {
  __$$RegisterStateImplCopyWithImpl(
      _$RegisterStateImpl _value, $Res Function(_$RegisterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$RegisterStateImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as ValidationItem,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as ValidationItem,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as ValidationItem,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ValidationItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterStateImpl extends _RegisterState {
  const _$RegisterStateImpl(
      {this.username = const ValidationItem(),
      this.email = const ValidationItem(),
      this.password = const ValidationItem(),
      this.confirmPassword = const ValidationItem()})
      : super._();

  factory _$RegisterStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterStateImplFromJson(json);

  @override
  @JsonKey()
  final ValidationItem username;
  @override
  @JsonKey()
  final ValidationItem email;
  @override
  @JsonKey()
  final ValidationItem password;
  @override
  @JsonKey()
  final ValidationItem confirmPassword;

  @override
  String toString() {
    return 'RegisterState(username: $username, email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      __$$RegisterStateImplCopyWithImpl<_$RegisterStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterStateImplToJson(
      this,
    );
  }
}

abstract class _RegisterState extends RegisterState {
  const factory _RegisterState(
      {final ValidationItem username,
      final ValidationItem email,
      final ValidationItem password,
      final ValidationItem confirmPassword}) = _$RegisterStateImpl;
  const _RegisterState._() : super._();

  factory _RegisterState.fromJson(Map<String, dynamic> json) =
      _$RegisterStateImpl.fromJson;

  @override
  ValidationItem get username;
  @override
  ValidationItem get email;
  @override
  ValidationItem get password;
  @override
  ValidationItem get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
