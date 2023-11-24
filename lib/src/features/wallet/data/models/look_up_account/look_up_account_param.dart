import 'package:freezed_annotation/freezed_annotation.dart';

part 'look_up_account_param.freezed.dart';
part 'look_up_account_param.g.dart';

@freezed
class LookupAccountParam with _$LookupAccountParam {
  const factory LookupAccountParam({
    required String account,
    required String type,
    required String bankCode,
  }) = _LookupAccountParam;

  factory LookupAccountParam.fromJson(Map<String, dynamic> json) =>
      _$LookupAccountParamFromJson(json);
}
