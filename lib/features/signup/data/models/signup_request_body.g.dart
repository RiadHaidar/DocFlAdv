// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestBody _$SignUpRequestBodyFromJson(Map<String, dynamic> json) =>
    SignUpRequestBody(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['passwordConfirmation'] as String,
    );

Map<String, dynamic> _$SignUpRequestBodyToJson(SignUpRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
    };
