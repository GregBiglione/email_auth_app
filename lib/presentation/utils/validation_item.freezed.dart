// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ValidationItem _$ValidationItemFromJson(Map<String, dynamic> json) {
  return _ValidationItem.fromJson(json);
}

/// @nodoc
mixin _$ValidationItem {
  String get value => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidationItemCopyWith<ValidationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationItemCopyWith<$Res> {
  factory $ValidationItemCopyWith(
          ValidationItem value, $Res Function(ValidationItem) then) =
      _$ValidationItemCopyWithImpl<$Res, ValidationItem>;
  @useResult
  $Res call({String value, String error});
}

/// @nodoc
class _$ValidationItemCopyWithImpl<$Res, $Val extends ValidationItem>
    implements $ValidationItemCopyWith<$Res> {
  _$ValidationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidationItemImplCopyWith<$Res>
    implements $ValidationItemCopyWith<$Res> {
  factory _$$ValidationItemImplCopyWith(_$ValidationItemImpl value,
          $Res Function(_$ValidationItemImpl) then) =
      __$$ValidationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String error});
}

/// @nodoc
class __$$ValidationItemImplCopyWithImpl<$Res>
    extends _$ValidationItemCopyWithImpl<$Res, _$ValidationItemImpl>
    implements _$$ValidationItemImplCopyWith<$Res> {
  __$$ValidationItemImplCopyWithImpl(
      _$ValidationItemImpl _value, $Res Function(_$ValidationItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? error = null,
  }) {
    return _then(_$ValidationItemImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationItemImpl implements _ValidationItem {
  const _$ValidationItemImpl({this.value = "", this.error = ""});

  factory _$ValidationItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationItemImplFromJson(json);

  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'ValidationItem(value: $value, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationItemImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationItemImplCopyWith<_$ValidationItemImpl> get copyWith =>
      __$$ValidationItemImplCopyWithImpl<_$ValidationItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationItemImplToJson(
      this,
    );
  }
}

abstract class _ValidationItem implements ValidationItem {
  const factory _ValidationItem({final String value, final String error}) =
      _$ValidationItemImpl;

  factory _ValidationItem.fromJson(Map<String, dynamic> json) =
      _$ValidationItemImpl.fromJson;

  @override
  String get value;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$ValidationItemImplCopyWith<_$ValidationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
