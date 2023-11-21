import 'package:flutter/material.dart';

import '../../common/appbars/center_appbar.dart';
import 'l_p_main_body.dart';

class LPMobileBuilder extends StatelessWidget {
  const LPMobileBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CenterAppbar(title: "Table Layout"),
      body: LPMainBody(),
    );
  }
}
