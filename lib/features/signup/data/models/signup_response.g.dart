// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingUpResponse _$SingUpResponseFromJson(Map<String, dynamic> json) =>
    SingUpResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$SingUpResponseToJson(SingUpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
      'code': instance.code,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      token: json['token'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
    };
