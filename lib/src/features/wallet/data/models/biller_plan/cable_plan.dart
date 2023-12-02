import 'package:freezed_annotation/freezed_annotation.dart';

part 'cable_plan.freezed.dart';
part 'cable_plan.g.dart';

@freezed
class CablePlan with _$CablePlan {
  const factory CablePlan({
    String? paymentCode,
    String? name,
    String? shortName,
    int? price,
    String? validity,
    String? code,
    String? addonCode,
    int? available,
  }) = _CablePlan;

  factory CablePlan.fromJson(Map<String, dynamic> json) =>
      _$CablePlanFromJson(json);
}
