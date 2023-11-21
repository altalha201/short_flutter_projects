import 'package:flutter/material.dart';

import '../models/routine_model.dart';

class FullRoutineProvider extends ChangeNotifier {
  RoutineModel _finalRoutine = RoutineModel();

  RoutineModel get finalRoutine => _finalRoutine;

  void update(RoutineModel newModel) {
    _finalRoutine = _finalRoutine.copyFrom(newModel);
  }
}