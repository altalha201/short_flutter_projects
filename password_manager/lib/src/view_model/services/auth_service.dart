import 'package:firebase_auth/firebase_auth.dart';

import '../../model/response_model.dart';

class AuthService {
  static Future<ResponseModel> login(String email, String pass) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      final userID = credential.user?.uid ?? "";
      return ResponseModel(
        isSuccess: true,
        statusCode: 200,
        body: userID,
      );
    } on FirebaseAuthException catch (e) {
      late String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }

      return ResponseModel(
        isSuccess: false,
        statusCode: 400,
        body: message,
      );
    } catch (e) {
      return ResponseModel(
        isSuccess: false,
        statusCode: 401,
      );
    }
  }

  static Future<ResponseModel> createAuth(String email, String pass) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      final uID = credential.user?.uid ?? "";

      return ResponseModel(
        isSuccess: true,
        statusCode: 200,
        body: uID,
      );
    } on FirebaseAuthException catch (e) {
      late String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }

      return ResponseModel(
        isSuccess: false,
        statusCode: 400,
        body: message,
      );
    } catch (e) {
      return ResponseModel(
        isSuccess: false,
        statusCode: 401,
      );
    }
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
