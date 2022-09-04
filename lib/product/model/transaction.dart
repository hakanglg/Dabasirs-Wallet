// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

enum TransactionType {
  @JsonValue("Expense")
  Expense,
  @JsonValue("Income")
  Income,
  @JsonValue("Saving")
  Saving
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

@JsonSerializable()
class TransactionModel {
  final String? transactionName;
  final TransactionType transactionType;
  final double? transactionAmount;
  @TimestampConverter()
  final DateTime transactionDate;
  final String? transactionId;

  TransactionModel(this.transactionName, this.transactionType,
      this.transactionAmount, this.transactionDate, this.transactionId);

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return _$TransactionModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TransactionModelToJson(this);
  }
}
