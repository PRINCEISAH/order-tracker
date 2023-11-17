import 'package:flutter/material.dart';

class StepperData {
  final String? title;
  final String? subtitle;
  final Widget? iconWidget;
  final DateTime? dateTime;
  final int? index;

  StepperData(
      {this.iconWidget, this.title, this.subtitle, this.dateTime, this.index});

  // CopyWith method
  StepperData copyWith({
    String? title,
    String? subtitle,
    Widget? iconWidget,
    DateTime? dateTime,
  }) {
    return StepperData(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      iconWidget: iconWidget ?? this.iconWidget,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
