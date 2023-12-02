import 'package:freezed_annotation/freezed_annotation.dart';

part 'look_up_account_model.freezed.dart';
part 'look_up_account_model.g.dart';

@freezed
class LookupAccountModel with _$LookupAccountModel {
  const factory LookupAccountModel({
    String? accountName,
    String? accountNumber,
    String? accountType,
    String? bankCode,
  }) = _LookupAccountModel;

  factory LookupAccountModel.fromJson(Map<String, dynamic> json) =>
      _$LookupAccountModelFromJson(json);
}
