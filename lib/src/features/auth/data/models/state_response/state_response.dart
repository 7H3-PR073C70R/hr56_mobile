// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_response.freezed.dart';
part 'state_response.g.dart';

@freezed
class StateResponse with _$StateResponse {
  const factory StateResponse({
    @JsonKey(name: 'id') num? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'capital') String? capital,
    @JsonKey(name: 'slogan') String? slogan,
    @JsonKey(name: 'region') String? region,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _StateResponse;

  factory StateResponse.fromJson(Map<String, dynamic> json) =>
      _$StateResponseFromJson(json);
}
