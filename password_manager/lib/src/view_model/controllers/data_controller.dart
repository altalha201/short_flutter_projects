import 'dart:developer';

import 'package:get/get.dart';

import '../../model/password_model.dart';
import '../helpers/collection_path.dart';
import '../helpers/helper_function.dart';
import '../services/encrypt_services.dart';
import '../services/storage_service.dart';
import 'profile_controller.dart';

class DataController extends GetxController {
  bool _addingNewData = false, _gettingList = false;
  final List<PasswordModel> _currentList = [];

  bool get addingNewData => _addingNewData;

  bool get gettingList => _gettingList;

  List<PasswordModel> get currentList => _currentList;

  String getPassword(String encrypted) => EncryptServices.retrieve(encrypted);

  Future<bool> addNew(
    int siteIndex,
    String siteName,
    String siteLogin,
    sitePass,
  ) async {
    _addingNewData = true;
    update();
    final model = PasswordModel(
      pId: HelperFunction.generate28(),
      siteIndex: siteIndex,
      siteName: siteName,
      siteLogin: siteLogin,
      sitePass: EncryptServices.create(sitePass),
    );

    final response = await StorageService.newDoc(
      CollectionPath.passCollection,
      model.pId ?? "",
      model.toJson(),
    );
    _addingNewData = false;
    if (response.isSuccess) {
      log("success");
      _currentList.add(model);
      Get.find<ProfileController>()
          .currentUser
          .userPassList
          ?.add(model.pId ?? "");
      final isUpdated =
          await Get.find<ProfileController>().updateCurrentProfile();
      update();
      return isUpdated;
    } else {
      log("failed");
      update();
      return false;
    }
  }

  Future<void> getList() async {
    _gettingList = true;
    update();
    List<String> list =
        Get.find<ProfileController>().currentUser.userPassList ?? [];
    _currentList.clear();
    for (var pass in list) {
      var response =
          await StorageService.getDoc(CollectionPath.passCollection, pass);
      if (response.isSuccess) {
        _currentList.add(PasswordModel.fromJson(response.body));
      }
    }
    _gettingList = false;
    update();
  }
}
