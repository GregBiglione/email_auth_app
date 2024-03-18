// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginStateImpl _$$LoginStateImplFromJson(Map<String, dynamic> json) =>
    _$LoginStateImpl(
      email: json['email'] == null
          ? const ValidationItem()
          : ValidationItem.fromJson(json['email'] as Map<String, dynamic>),
      password: json['password'] == null
          ? const ValidationItem()
          : ValidationItem.fromJson(json['password'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginStateImplToJson(_$LoginStateImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
