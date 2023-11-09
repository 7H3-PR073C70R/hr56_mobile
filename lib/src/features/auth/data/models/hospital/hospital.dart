// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital.freezed.dart';
part 'hospital.g.dart';

@freezed
class Hospital with _$Hospital {
  const factory Hospital({
    @JsonKey(name: 'hospital_id') num? hospitalId,
    @JsonKey(name: 'hospital_name') String? hospitalName,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);
}
