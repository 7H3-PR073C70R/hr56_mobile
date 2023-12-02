import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_bank.freezed.dart';
part 'wallet_bank.g.dart';

@freezed
class WalletBank with _$WalletBank {
  const factory WalletBank({
    int? id,
    String? code,
    String? avatar,
    String? name,
  }) = _WalletBank;

  factory WalletBank.fromJson(Map<String, dynamic> json) =>
      _$WalletBankFromJson(json);
}
