import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/response_model.dart';

class StorageService {
  static Future<ResponseModel> newDoc(
    String collection,
    String docID,
    Map<String, dynamic> json,
  ) async {
    final db = FirebaseFirestore.instance;
    try {
      await db.collection(collection).doc(docID).set(json);
      return ResponseModel(
        isSuccess: true,
        statusCode: 200,
      );
    } catch (e) {
      return ResponseModel(
        isSuccess: false,
        statusCode: 401,
      );
    }
  }

  static Future<ResponseModel> getDoc(
      String collection,
      String docID,
      ) async {
    final db = FirebaseFirestore.instance;
    try {
      var json = await db.collection(collection).doc(docID).get();
      return ResponseModel(
        isSuccess: true,
        statusCode: 200,
        body: json,
      );
    } catch (e) {
      return ResponseModel(
        isSuccess: false,
        statusCode: 401,
      );
    }
  }

  static Future<ResponseModel> updateDoc(
    String collection,
    String docID,
    Map<String, dynamic> json,
  ) async {
    final db = FirebaseFirestore.instance;
    try {
      await db.collection(collection).doc(docID).update(json);
      return ResponseModel(
        isSuccess: true,
        statusCode: 200,
      );
    } catch (e) {
      return ResponseModel(
        isSuccess: false,
        statusCode: 401,
      );
    }
  }

  static Future<ResponseModel> deleteDoc(
      String collection, String docID) async {
    final db = FirebaseFirestore.instance;
    try {
      await db.collection(collection).doc(docID).delete();
      return ResponseModel(
        isSuccess: true,
        statusCode: 200,
      );
    } catch (e) {
      return ResponseModel(
        isSuccess: false,
        statusCode: 401,
      );
    }
  }
}
