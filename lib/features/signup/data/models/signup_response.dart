

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_response.g.dart';


@JsonSerializable()
class SingUpResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? data;
  bool? status;
  int? code;

  SingUpResponse({this.message, this.data, this.status, this.code});

  factory SingUpResponse.fromJson(Map<String, dynamic> json)=> _$SingUpResponseFromJson(json);

}


@JsonSerializable()

class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? username;

  UserData({this.token, this.username});


  factory UserData.fromJson(Map<String, dynamic> json)=>_$UserDataFromJson(json);

}
