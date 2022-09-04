// ignore_for_file: avoid_print

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/transaction.dart';

enum CollectionEnums { users, transactions }

class FireStoreService {
  FireStoreService(this._db);
  final FirebaseFirestore _db;

  StreamSubscription? _userSubscribe;

  late final CollectionReference _currentUser =
      _db.collection(CollectionEnums.users.name);

  Future<void> addTransaction(TransactionModel model, User user) async {
    return _currentUser
        .doc(user.uid)
        .collection(CollectionEnums.transactions.name)
        .doc(model.transactionId)
        .set({
          "transactionType": model.transactionType.name,
          "transactionName": model.transactionName,
          "transactionAmount": model.transactionAmount,
          "transactionDate": model.transactionDate,
          "transactionId": model.transactionId
        })
        .then((value) => print("transaction Added"))
        .catchError((error) => print("Failed to add transaction: $error"));
  }

  Stream<QuerySnapshot> getTransactions(User? user) {
    return _currentUser
        .doc(user?.uid)
        .collection(CollectionEnums.transactions.name)
        .orderBy('transactionDate', descending: true)
        .snapshots();
  }

  //
  Stream<QuerySnapshot> getsingleCategoryTransactions(User? user) {
    return _currentUser
        .doc(user?.uid)
        .collection(CollectionEnums.transactions.name)
        .snapshots();
  }

  Future<void> deleteTransaction(String? path, User? user) async {
    return _currentUser
        .doc(user?.uid)
        .collection(CollectionEnums.transactions.name)
        .doc(path)
        .delete()
        .then((value) => print("Transaction Deleted"))
        .catchError((error) => print("$error"));
  }

  Future<void> findTransactionId(String? path, User? user) async {
    return await _currentUser
        .doc(user?.uid)
        .collection(CollectionEnums.transactions.name)
        .doc(path)
        .delete()
        .then((value) => print(_currentUser
            .doc(user?.uid)
            .collection(CollectionEnums.transactions.name)
            .doc(path)))
        .catchError((error) => print("$error"));
  }

  Future<void> deleteDoc(String path, String id) async {
    await _currentUser.doc(id).get().then((value) => print(id));
  }

// USER TRANSACTIONS
  Future<void> addUserToDB(User? user, {String? name}) async {
    await _currentUser.doc(user?.uid).set({
      "uid": user?.uid,
      "name": user?.displayName ?? name,
      "email": user?.email,
      "photoUrl": user?.photoURL ??
          "https://rapidapi.com/cdn/images?url=https://rapidapi-prod-apis.s3.amazonaws.com/b42aa17d-8ae0-4a28-b29f-587af5454390.png",
      "createdAt": DateTime.now(),
    });
  }

  Future<void> updateUser(UserCredential user, String newName) async {
    await _db
        .doc("${CollectionEnums.users.name}/${user.user!.uid}")
        .update(<String, dynamic>{"name": newName});
  }

  Future<void> deleteUser(User user) async {
    await _db.doc("${CollectionEnums.users.name}/${user.uid}").delete();
  }

  // Future<void> fetchDataOneTime() async {
  //   var uniqUserDoc = await _db
  //       .doc("${CollectionEnums.users.name}/DoTvXIZITCY3xphbOX6Hbta1ICV2")
  //       .get();
  //   debugPrint(uniqUserDoc.data()!["name"].toString());
  // }

  fetchDataSnapshot() async {
    var userStream = _db.collection(CollectionEnums.users.name).snapshots();

    userStream.listen((event) {
      _userSubscribe = userStream.listen((event) {
        // event is a snapshot
        // ! değişenleri kontrol etmek için
        // event.docChanges.forEach((element) {
        //   print(element.doc.data().toString());
        // });

        // ! tüm verileri getirir
        for (var element in event.docs) {
          print(element.data().toString());
        }
      });
    });
  }

  fetchUniqUserDataRealTime() async {
    var userDocStream = _db
        .doc("${CollectionEnums.users.name}/DoTvXIZITCY3xphbOX6Hbta1ICV2")
        .snapshots();
    _userSubscribe = userDocStream.listen((event) {
      print(event.data().toString());
    });
  }

  stopStream() async {
    await _userSubscribe?.cancel();
  }

  Future<QuerySnapshot> readUserFromDB() async {
    final users = await _db.collection(CollectionEnums.users.name).get();
    return users;
  }
}
