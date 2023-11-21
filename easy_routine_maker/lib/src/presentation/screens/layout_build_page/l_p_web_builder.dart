import 'package:flutter/material.dart';

import '../../common/appbars/side_appbar.dart';
import 'l_p_main_body.dart';

class LPWebBuilder extends StatelessWidget {
  const LPWebBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const SideAppbar(
              title: "Table Layout",
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  constraints: const BoxConstraints(
                    minWidth: 182,
                    maxWidth: 420,
                  ),
                  child: const LPMainBody(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
