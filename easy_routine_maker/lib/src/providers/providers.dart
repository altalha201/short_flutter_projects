import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'full_routine_provider.dart';
import 'layout_screen_provider.dart';

class Providers {
  static List<SingleChildWidget> all = [
    ChangeNotifierProvider<LayoutScreenProvider>(
      create: (context) => LayoutScreenProvider(),
    ),
    ChangeNotifierProvider<FullRoutineProvider>(
      create: (context) => FullRoutineProvider(),
    ),
  ];
}
