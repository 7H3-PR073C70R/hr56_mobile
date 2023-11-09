// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'token_type') String? tokenType,
    @JsonKey(name: 'token') String? token,
    @JsonKey(name: 'user') User? user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'profile_photo_path') String? profilePhotoPath,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'is_completed') String? isCompleted,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'personal_information_id') int? personalInformationId,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
