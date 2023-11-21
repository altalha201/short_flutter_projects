import 'package:flutter/material.dart';

class PeriodModel {
  PeriodModel({
    required this.startTime,
    required this.duration,
    this.isBreak,
    required this.periodAt,
  });

  final TimeOfDay startTime;
  final int duration;
  final bool? isBreak;
  final int periodAt;

  PeriodModel copyWith({
    TimeOfDay? startTime,
    int? duration,
    bool? isBreak,
    int? periodAt,
  }) {
    return PeriodModel(
      startTime: startTime ?? this.startTime,
      duration: duration ?? this.duration,
      isBreak: isBreak ?? this.isBreak,
      periodAt: periodAt ?? this.periodAt,
    );
  }
}
