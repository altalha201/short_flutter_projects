import 'dart:developer';

import 'package:get/get.dart';

import '../../model/user_model.dart';
import '../helpers/collection_path.dart';
import '../services/encrypt_services.dart';
import '../services/storage_service.dart';
import 'data_controller.dart';

class ProfileController extends GetxController {
  UserModel _loggedInUser = UserModel();
  String _currentUserID = "";

  UserModel get currentUser => _loggedInUser;

  String get userId => _currentUserID;

  Future<bool> setUser(String newUserID) async {
    _currentUserID = newUserID;
    update();
    return await getUser();
  }

  Future<bool> getUser() async {
    final response = await StorageService.getDoc(
      CollectionPath.userCollection,
      _currentUserID,
    );
    if (response.isSuccess) {
      _loggedInUser = UserModel.fromJson(response.body);
      await Get.find<DataController>().getList();
      update();
      return true;
    } else {
      log("Something went wrong.");
      return false;
    }
  }

  Future<bool> createNewUser(
    String userID,
    String name,
    String email,
    String password,
  ) async {
    final userNew = UserModel(
      userId: userID,
      userName: name,
      userEmail: email,
      userPass: EncryptServices.create(password),
      userPassList: [],
    );
    final response = await StorageService.newDoc(
      CollectionPath.userCollection,
      userID,
      userNew.toJson(),
    );

    if (response.isSuccess) {
      _loggedInUser = userNew;
      _currentUserID = userNew.userId ?? userID;
      update();
      return true;
    } else {
      log("Something went wrong.");
      return false;
    }
  }

  Future<bool> updateCurrentProfile() async {
    final response = await StorageService.updateDoc(
      CollectionPath.userCollection,
      _currentUserID,
      _loggedInUser.toJson(),
    );
    log(response.isSuccess ? "success" : "failed");
    return response.isSuccess;
  }

  void clearCurrent() {
    _loggedInUser = UserModel();
    _currentUserID = "";
    update();
  }
}
