
import 'package:flutter/material.dart';

extension TimeOfDayExtensions on TimeOfDay {
  String format12Hour(BuildContext context) {
    TimeOfDay time = replacing(hour: hourOfPeriod);
    MaterialLocalizations localizations = MaterialLocalizations.of(context);

    final StringBuffer buffer = StringBuffer();

    buffer
      ..write(time.format(context))
      ..write(' ')
      ..write(period == DayPeriod.am
          ? localizations.anteMeridiemAbbreviation
          : localizations.postMeridiemAbbreviation);

    return '$buffer';
  }
}