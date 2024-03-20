// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordStateImpl _$$ResetPasswordStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordStateImpl(
      email: json['email'] == null
          ? const ValidationItem()
          : ValidationItem.fromJson(json['email'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResetPasswordStateImplToJson(
        _$ResetPasswordStateImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
