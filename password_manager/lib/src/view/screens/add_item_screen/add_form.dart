import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/controllers/add_form_controller.dart';
import '../../../view_model/controllers/data_controller.dart';
import '../../components/filled_drop_down.dart';
import '../../components/filled_text_input.dart';
import '../main_screen/home_page.dart';

class AddForm extends StatefulWidget {
  const AddForm({
    super.key,
  });

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final GlobalKey<FormState> _addKey = GlobalKey<FormState>();
  late final TextEditingController _loginInfoET, _siteNameET, _passET;

  @override
  void initState() {
    _loginInfoET = TextEditingController();
    _passET = TextEditingController();
    _siteNameET = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _loginInfoET.dispose();
    _passET.dispose();
    _siteNameET.dispose();
    Get.find<AddFormController>().clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddFormController>(
      builder: (addFormController) {
        return Form(
          key: _addKey,
          child: _buildFields(addFormController),
        );
      },
    );
  }

  Widget _buildFields(AddFormController addFormController) {
    return Column(
      children: [
        FilledDropDown(
          value: addFormController.dropdownValue,
          hintText: "Select Site",
          items: addFormController.dropdownItems,
          onChanged: addFormController.updateDropdownValue,
          validator: addFormController.dropdownValidator,
        ),
        const SizedBox(height: 8.0),
        if (addFormController.dropdownValue == "others")
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledTextInput(
                hintText: "Site Name",
                controller: _siteNameET,
                validator: addFormController.siteNameValidator,
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        FilledTextInput(
          hintText: "Email or user name",
          controller: _loginInfoET,
          validator: addFormController.loginInfoValidator,
        ),
        const SizedBox(height: 8.0),
        FilledTextInput(
          hintText: "Password",
          controller: _passET,
          obscureText: true,
          validator: addFormController.passValidator,
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: ()  async {
              if (_addKey.currentState?.validate() ?? false) {
                final response = await Get.find<DataController>().addNew(
                  addFormController.selectedSite?.siteIndex ?? 15,
                  addFormController.dropdownValue == "others"
                      ? _siteNameET.text
                      : addFormController.selectedSite?.siteName ?? "",
                  _loginInfoET.text,
                  _passET.text,
                );

                if (response) {
                  Get.offAll(const HomePage());
                }
              }
            },
            child: const Text("Add"),
          ),
        ),
      ],
    );
  }
}
