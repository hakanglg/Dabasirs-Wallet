import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../product/model/transaction.dart';
import '../../../product/service/firebase_firestore_service.dart';
import '../../auth/service/firebase_auth_service.dart';

class HistoryProvider extends ChangeNotifier {
  final FireStoreService _db = FireStoreService(FirebaseFirestore.instance);
  final FirebaseAuthService _auth = FirebaseAuthService(FirebaseAuth.instance);

  Stream<List<TransactionModel>> getTransactionList() {
    Stream<List<DocumentSnapshot>> streamListDocument =
        _db.getTransactions(_auth.user).map((event) => event.docs);

    Stream<List<TransactionModel>> streamListTransaction =
        streamListDocument.map((listOfDocSnap) => listOfDocSnap
            .map((docSnap) => TransactionModel.fromJson(
                docSnap.data() as Map<String, dynamic>))
            .toList());

    return streamListTransaction;
  }

  Future<void> addTransaction(TransactionModel transaction, User user) async {
    await _db.addTransaction(transaction, user);
    notifyListeners();
  }

  Future<void> removeTransaction(
      TransactionModel transaction, User user) async {
    return await _db.deleteTransaction(transaction.transactionId, user);
  }
}
