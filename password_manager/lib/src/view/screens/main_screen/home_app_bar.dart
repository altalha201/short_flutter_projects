import 'package:flutter/material.dart';

import '../../helper/view_constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey.shade300,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      title: Image.asset(
        ViewConstants.iconLogoImg,
        height: 45,
        width: 45,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
