import 'package:flutter/material.dart';

import '../../components/password_list_item.dart';

class PasswordListView extends StatelessWidget {
  const PasswordListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const PasswordListItem();
      },
    );
  }
}