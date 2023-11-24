import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_wallet_param.freezed.dart';
part 'create_wallet_param.g.dart';

@freezed
class CreateWalletParam with _$CreateWalletParam {
  const factory CreateWalletParam({
    @Default('customer') String type,
  }) = _CreateWalletParam;

  factory CreateWalletParam.fromJson(Map<String, dynamic> json) =>
      _$CreateWalletParamFromJson(json);
}
