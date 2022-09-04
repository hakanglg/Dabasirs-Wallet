// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      json['transactionName'] as String?,
      $enumDecode(_$TransactionTypeEnumMap, json['transactionType']),
      (json['transactionAmount'] as num?)?.toDouble(),
      const TimestampConverter().fromJson(json['transactionDate'] as Timestamp),
      json['transactionId'] as String?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'transactionName': instance.transactionName,
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType]!,
      'transactionAmount': instance.transactionAmount,
      'transactionDate':
          const TimestampConverter().toJson(instance.transactionDate),
      'transactionId': instance.transactionId,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.Expense: 'Expense',
  TransactionType.Income: 'Income',
  TransactionType.Saving: 'Saving',
};
