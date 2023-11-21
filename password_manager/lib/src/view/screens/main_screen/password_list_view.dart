import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/controllers/data_controller.dart';
import '../../components/loadings/circle_loading.dart';
import '../../components/password_list_item.dart';

class PasswordListView extends StatelessWidget {
  const PasswordListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (dataController) {
        if (dataController.gettingList) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: const CircleLoading(),
          );
        }
        if (dataController.currentList.isEmpty) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: const Center(
              child: Text("No Passwords"),
            ),
          );
        }
        return ListView.builder(
          itemCount: dataController.currentList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return PasswordListItem(
              item: dataController.currentList.elementAt(index),
            );
          },
        );
      },
    );
  }
}
