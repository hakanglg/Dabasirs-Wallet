import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../product/model/transaction.dart';
import '../../../product/service/firebase_firestore_service.dart';
import '../../auth/service/firebase_auth_service.dart';

class ChartsProvider extends ChangeNotifier {
  final FireStoreService _db = FireStoreService(FirebaseFirestore.instance);
  final FirebaseAuthService _auth = FirebaseAuthService(FirebaseAuth.instance);

  Stream<List<TransactionModel>>
      getAllTransactionSingleCategoryWithWithCurrentMonth(
          DateTime selectedDay, TransactionType category) {
    Stream<List<DocumentSnapshot>> streamListDocument = _db
        .getsingleCategoryTransactions(_auth.user)
        .map((event) => event.docs);

    Stream<List<TransactionModel>>
        streamListSingleCategoryWithMounthTransaction = streamListDocument.map(
            (listOfDocSnap) => listOfDocSnap
                .map((docSnap) => TransactionModel.fromJson(
                    docSnap.data() as Map<String, dynamic>))
                .where((transaction) =>
                    transaction.transactionType == category &&
                    transaction.transactionDate.month == selectedDay.month &&
                    selectedDay.year == transaction.transactionDate.year)
                .toList());

    return streamListSingleCategoryWithMounthTransaction;
  }

  Stream<List<TransactionModel>> getAllTransactionSingleCategoryWithCurrentYear(
      DateTime selectedDay, TransactionType category) {
    Stream<List<DocumentSnapshot>> streamListDocument = _db
        .getsingleCategoryTransactions(_auth.user)
        .map((event) => event.docs);

    Stream<List<TransactionModel>> streamListSingleCategoryWithYearTransaction =
        streamListDocument.map((listOfDocSnap) => listOfDocSnap
            .map((docSnap) => TransactionModel.fromJson(
                docSnap.data() as Map<String, dynamic>))
            .where((transaction) =>
                transaction.transactionType == category &&
                transaction.transactionDate.year == selectedDay.year)
            .toList());

    return streamListSingleCategoryWithYearTransaction;
  }

  Stream<List<TransactionModel>> getAllTransactionSingleCategory(
      TransactionType category) {
    Stream<List<DocumentSnapshot>> streamListDocument = _db
        .getsingleCategoryTransactions(_auth.user)
        .map((event) => event.docs);

    Stream<List<TransactionModel>> streamListSingleCategoryTransactions =
        streamListDocument.map((listOfDocSnap) => listOfDocSnap
            .map((docSnap) => TransactionModel.fromJson(
                docSnap.data() as Map<String, dynamic>))
            .where((transaction) => transaction.transactionType == category)
            .toList());

    return streamListSingleCategoryTransactions;
  }
}
