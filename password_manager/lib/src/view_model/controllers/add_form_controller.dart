import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/site_model.dart';
import '../../view/helper/site_list.dart';

class AddFormController extends GetxController {
  String? _dropdownValue;
  SiteModel? _selectedSite;

  final List<DropdownMenuItem<dynamic>> _dropdownItems = SiteList.sites
      .map(
        (site) => DropdownMenuItem(
          value: site.value,
          child: Text(site.siteName),
        ),
      )
      .toList();

  List<DropdownMenuItem<dynamic>> get dropdownItems => _dropdownItems;
  String? get dropdownValue => _dropdownValue;
  SiteModel? get selectedSite => _selectedSite;

  void updateDropdownValue(dynamic value) {
    _dropdownValue = value;
    for (var site in SiteList.sites) {
      if(site.value == _dropdownValue) {
        _selectedSite = site;
        break;
      }
    }
    update();
  }

  void clear() {
    _dropdownValue = null;
    update();
  }

  String? dropdownValidator(dynamic value) {
    if(_dropdownValue?.isEmpty ?? true) {
      return "Select a site";
    }
    return null;
  }

  String? siteNameValidator(String? value) {
    if(_dropdownValue == "others" && (value?.isEmpty ?? true)) {
      return "Site name is required";
    }
    return null;
  }

  String? loginInfoValidator(String? value) {
    if(value?.isEmpty ?? true) {
      return "Email or user name is required";
    }
    return null;
  }

  String? passValidator(String? value) {
    if((value?.length ?? 0) <= 5) {
      return "Password need to be 6 or more character";
    }
    return null;
  }
}
