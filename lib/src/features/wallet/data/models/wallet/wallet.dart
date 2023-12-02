import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class Wallet with _$Wallet {
  const factory Wallet({
    int? id,
    String? walletName,
    String? walletNumber,
    String? walletId,
    String? currency,
    String? schemeId,
    String? accountName,
    String? accountNumber,
    String? bookedBalance,
    String? availableBalance,
    String? bankCode,
    String? bankName,
    String? type,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? status,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}
