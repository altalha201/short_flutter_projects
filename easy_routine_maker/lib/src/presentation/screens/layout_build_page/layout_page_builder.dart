import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/layout_screen_provider.dart';
import 'l_p_mobile_builder.dart';
import 'l_p_web_builder.dart';

class LayoutPageBuilder extends StatefulWidget {
  const LayoutPageBuilder({super.key});

  @override
  State<LayoutPageBuilder> createState() => _LayoutPageBuilderState();
}

class _LayoutPageBuilderState extends State<LayoutPageBuilder> {

  @override
  void initState() {
    Provider.of<LayoutScreenProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<LayoutScreenProvider>(context, listen: false).destroy();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constance) {
        if (MediaQuery.of(context).size.width < 550) {
          return const LPMobileBuilder();
        } else {
          return const LPWebBuilder();
        }
      },
    );
  }
}
