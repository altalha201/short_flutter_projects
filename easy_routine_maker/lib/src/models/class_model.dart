import 'enums/days.dart';

class ClassModel {
  ClassModel({
    this.title,
    this.subtitle,
    this.text,
    this.days,
    this.onPeriod,
  });

  final String? title;
  final String? subtitle;
  final String? text;
  final Days? days;
  final int? onPeriod;

  ClassModel copyWith({
    String? title,
    String? subtitle,
    String? text,
    Days? days,
    int? onPeriod,
  }) {
    return ClassModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      text: text ?? this.text,
      days: days ?? this.days,
      onPeriod: onPeriod ?? this.onPeriod,
    );
  }
}

