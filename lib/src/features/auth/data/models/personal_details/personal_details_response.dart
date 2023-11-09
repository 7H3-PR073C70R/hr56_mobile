// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_details_response.freezed.dart';
part 'personal_details_response.g.dart';

@freezed
class PersonalDetailsResponse with _$PersonalDetailsResponse {
  const factory PersonalDetailsResponse({
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'personal_information') String? personalInformation,
    @JsonKey(name: 'employment') String? employment,
  }) = _PersonalDetailsResponse;

  factory PersonalDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonalDetailsResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'profile_photo_path') String? profilePhotoPath,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'is_completed') String? isCompleted,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'personal_information_id') String? personalInformationId,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
