import 'package:flutter/material.dart';

import '../../components/filled_drop_down.dart';
import '../../components/filled_text_input.dart';
import '../../helper/site_list.dart';

class AddForm extends StatefulWidget {
  const AddForm({
    super.key,
  });

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final List<DropdownMenuItem<dynamic>> _dropdownItems = SiteList.sites
      .map(
        (site) => DropdownMenuItem(
          value: site.value,
          child: Text(site.siteName),
        ),
      )
      .toList();

  final GlobalKey<FormState> _addKey = GlobalKey<FormState>();
  String? _dropdownValue;

  void _onDropdownChange(dynamic value) {
    setState(() {
      _dropdownValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addKey,
      child: Column(
        children: [
          FilledDropDown(
            value: _dropdownValue,
            hintText: "Select Site",
            items: _dropdownItems,
            onChanged: _onDropdownChange,
          ),
          const SizedBox(height: 8.0),
          if(_dropdownValue == "others")
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledTextInput(hintText: "Site Name"),
                SizedBox(height: 8.0),
              ],
            ),
          const FilledTextInput(hintText: "Email or user name"),
          const SizedBox(height: 8.0),
          const FilledTextInput(hintText: "Password"),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Add"),
            ),
          ),
        ],
      ),
    );
  }
}
