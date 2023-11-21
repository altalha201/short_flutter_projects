import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/material_router.dart';
import '../models/routine_model.dart';
import '../presentation/screens/period_define_page/period_page_builder.dart';
import 'full_routine_provider.dart';

class LayoutScreenProvider extends ChangeNotifier {
  late final TextEditingController _titleET, _subtitleET, _noticeBeforeET, _noticeAfterET, _periodCountET;

  TextEditingController get titleET => _titleET;
  TextEditingController get subtitleET => _subtitleET;
  TextEditingController get noticeBeforeET => _noticeBeforeET;
  TextEditingController get noticeAfterET => _noticeAfterET;
  TextEditingController get periodCountET => _periodCountET;

  void init() {
    _titleET = TextEditingController();
    _subtitleET = TextEditingController();
    _noticeBeforeET = TextEditingController();
    _noticeAfterET = TextEditingController();
    _periodCountET = TextEditingController();
  }

  void destroy() {
    _titleET.dispose();
    _subtitleET.dispose();
    _noticeBeforeET.dispose();
    _noticeAfterET.dispose();
    _periodCountET.dispose();
  }

  void clear() {
    _titleET.clear();
    _subtitleET.clear();
    _noticeBeforeET.clear();
    _noticeAfterET.clear();
    _periodCountET.clear();
  }

  void goNext(BuildContext context) async {
    var periodCount = 0;
    if (_periodCountET.text.isNotEmpty) {
      periodCount = int.parse(_periodCountET.text);
    }
    var newRoutine = RoutineModel(
      tableTitle: _titleET.text,
      tableSubtitle: _subtitleET.text,
      noticeBeforeTitle: _noticeBeforeET.text,
      noticeAfterTitle: _noticeAfterET.text,
      numberOfPeriods: periodCount,
    );
    Provider.of<FullRoutineProvider>(context, listen: false).update(newRoutine);
    if(context.mounted) {
      MaterialRouter.push(context, const PeriodPageBuilder());
    }
  }
}