import 'class_model.dart';
import 'enums/days.dart';
import 'period_model.dart';

class RoutineModel {
  RoutineModel({
    this.tableTitle,
    this.tableSubtitle,
    this.noticeBeforeTitle,
    this.noticeAfterTitle,
    this.breakPeriodAt,
    this.numberOfPeriods,
    this.periods,
    this.offDays,
    this.classes,
  });

  final String? tableTitle;
  final String? tableSubtitle;
  final String? noticeBeforeTitle;
  final String? noticeAfterTitle;
  final int? breakPeriodAt;
  final int? numberOfPeriods;
  final List<PeriodModel>? periods;
  final List<Days>? offDays;
  final Map<Days, List<ClassModel>>? classes;

  RoutineModel copyWith({
    String? tableTitle,
    String? tableSubtitle,
    String? noticeBeforeTitle,
    String? noticeAfterTitle,
    int? breakPeriodAt,
    int? numberOfPeriods,
    List<PeriodModel>? periods,
    List<Days>? offDays,
    Map<Days, List<ClassModel>>? classes,
  }) {
    return RoutineModel(
      tableTitle: tableTitle ?? this.tableTitle,
      tableSubtitle: tableSubtitle ?? this.tableSubtitle,
      noticeBeforeTitle: noticeBeforeTitle ?? this.noticeBeforeTitle,
      noticeAfterTitle: noticeAfterTitle ?? this.noticeAfterTitle,
      breakPeriodAt: breakPeriodAt ?? this.breakPeriodAt,
      numberOfPeriods: numberOfPeriods ?? this.numberOfPeriods,
      periods: periods ?? this.periods,
      offDays: offDays ?? this.offDays,
      classes: classes ?? this.classes,
    );
  }

  RoutineModel copyFrom(RoutineModel newModel) {
    return RoutineModel(
      tableTitle: newModel.tableTitle ?? tableTitle,
      tableSubtitle: newModel.tableSubtitle ?? tableSubtitle,
      noticeBeforeTitle: newModel.noticeBeforeTitle ?? noticeBeforeTitle,
      noticeAfterTitle: newModel.noticeAfterTitle ?? noticeAfterTitle,
      breakPeriodAt: newModel.breakPeriodAt ?? breakPeriodAt,
      numberOfPeriods: newModel.numberOfPeriods ?? numberOfPeriods,
      periods: newModel.periods ?? periods,
      offDays: newModel.offDays ?? offDays,
      classes: newModel.classes ?? classes,
    );
  }
}