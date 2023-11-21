import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/password_model.dart';
import '../../view_model/controllers/data_controller.dart';
import '../helper/dialogs.dart';
import '../helper/view_constants.dart';
import 'bottom_sheet/edit_bottom_sheet.dart';

class PasswordListItem extends StatelessWidget {
  const PasswordListItem({
    super.key,
    required this.item,
  });

  final PasswordModel item;

  void _onTap() {
    Dialogs.passwordDialog(
      password: item.sitePass ?? "",
      siteName: item.siteName ?? "",
      loginInfo: item.siteLogin ?? "",
    );
  }

  void _onEdit() {
    Get.back();
    Get.bottomSheet(
      EditBottomSheet(
        siteID: item.pId ?? "",
        sitePass: item.sitePass ?? "",
      ),
      backgroundColor: Colors.transparent,
    );
  }

  void _onDelete() async {
    Get.back();
    Dialogs.warningDialog(
      title: "Delete?",
      message: "Want to delete ${item.siteLogin} account of ${item.siteName}?",
      confirmText: "Delete",
      onConfirm: () async {
        await Get.find<DataController>().deletePassword(item.pId ?? "");
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        onTap: _onTap,
        tileColor: Colors.blueGrey.shade300,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        leading: _buildSiteImage(),
        title: Text(item.siteName ?? "Unknown"),
        subtitle: Text(item.siteLogin ?? "Unknown"),
        trailing: _buildPopupMenuButton(),
      ),
    );
  }

  Widget _buildPopupMenuButton() {
    return PopupMenuButton<dynamic>(
      color: Colors.blueGrey.shade900,
      itemBuilder: (context) => [
        PopupMenuItem(
          child: TextButton.icon(
            onPressed: _onEdit,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.edit),
            label: const Text("Edit"),
          ),
        ),
        PopupMenuItem(
          child: TextButton.icon(
            onPressed: _onDelete,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.delete),
            label: const Text("Delete"),
          ),
        ),
      ],
    );
  }

  Widget _buildSiteImage() {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        color: Colors.white70,
        image: DecorationImage(
          image: AssetImage(
            ViewConstants.getSiteLogoAt(item.siteIndex ?? 15),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
