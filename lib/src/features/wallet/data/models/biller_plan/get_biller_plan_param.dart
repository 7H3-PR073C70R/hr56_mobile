import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_biller_plan_param.freezed.dart';
part 'get_biller_plan_param.g.dart';

@freezed
class GetBillerPlanParam with _$GetBillerPlanParam {
  const factory GetBillerPlanParam({
    required String serviceType,
  }) = _GetBillerPlanParam;

  factory GetBillerPlanParam.fromJson(Map<String, dynamic> json) =>
      _$GetBillerPlanParamFromJson(json);
}
