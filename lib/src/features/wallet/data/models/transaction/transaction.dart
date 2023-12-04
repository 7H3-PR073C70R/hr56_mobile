// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'amount') String? amount,
    @JsonKey(name: 'reference') String? reference,
    @JsonKey(name: 'narration') String? narration,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'action') String? action,
    @JsonKey(name: 'charge') String? charge,
    @JsonKey(name: 'balance_before') String? balanceBefore,
    @JsonKey(name: 'balance_after') String? balanceAfter,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'transactionToken') dynamic transactionToken,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
