// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterStateImpl _$$RegisterStateImplFromJson(Map<String, dynamic> json) =>
    _$RegisterStateImpl(
      username: json['username'] == null
          ? const ValidationItem()
          : ValidationItem.fromJson(json['username'] as Map<String, dynamic>),
      email: json['email'] == null
          ? const ValidationItem()
          : ValidationItem.fromJson(json['email'] as Map<String, dynamic>),
      password: json['password'] == null
          ? const ValidationItem()
          : ValidationItem.fromJson(json['password'] as Map<String, dynamic>),
      confirmPassword: json['confirmPassword'] == null
          ? const ValidationItem()
          : ValidationItem.fromJson(
              json['confirmPassword'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RegisterStateImplToJson(_$RegisterStateImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
