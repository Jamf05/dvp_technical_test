import 'package:flutter/material.dart';

class Validators {
  static double _timeOfDayToDouble(TimeOfDay tod) => tod.hour + tod.minute / 60.0;

  static bool timeOfDayIsAfterNow(TimeOfDay tod) {
    if (_timeOfDayToDouble(tod) > _timeOfDayToDouble(TimeOfDay.now())) {
      return true;
    }
    return false;
  }

  static bool timeOfDay1IsAfter2(TimeOfDay tod1, TimeOfDay tod2) {
    if (_timeOfDayToDouble(tod1) > _timeOfDayToDouble(tod2)) {
      return true;
    }
    return false;
  }
}
