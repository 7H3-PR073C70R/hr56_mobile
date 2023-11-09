// To parse this JSON data, do
//
//     final loginParam = loginParamFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_param.freezed.dart';
part 'login_param.g.dart';

@freezed
class LoginParam with _$LoginParam {
  const factory LoginParam({
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
  }) = _LoginParam;

  factory LoginParam.fromJson(Map<String, dynamic> json) =>
      _$LoginParamFromJson(json);
}
