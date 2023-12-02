import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_data_plan.freezed.dart';
part 'provider_data_plan.g.dart';

@freezed
class ProviderDataPlan with _$ProviderDataPlan {
  const factory ProviderDataPlan({
    String? code,
    String? description,
    String? amount,
    String? duration,
  }) = _ProviderDataPlan;

  factory ProviderDataPlan.fromJson(Map<String, dynamic> json) =>
      _$ProviderDataPlanFromJson(json);
}
