import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_provider_data_param.freezed.dart';
part 'get_provider_data_param.g.dart';

@freezed
class GetProviderDataParam with _$GetProviderDataParam {
  const factory GetProviderDataParam({
    required String billerId,
  }) = _GetProviderDataParam;

  factory GetProviderDataParam.fromJson(Map<String, dynamic> json) =>
      _$GetProviderDataParamFromJson(json);
}
