import 'package:freezed_annotation/freezed_annotation.dart';

part 'biller.freezed.dart';
part 'biller.g.dart';

@freezed
class Biller with _$Biller {
  const factory Biller({
    int? billerId,
    String? name,
    String? code,
    String? maximumPurchaseAllowed,
    String? minimumPurchaseAllowedAmount,
    String? avatar,
  }) = _Biller;

  factory Biller.fromJson(Map<String, dynamic> json) => _$BillerFromJson(json);
}
