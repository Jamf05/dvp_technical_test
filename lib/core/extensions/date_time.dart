extension DateOnlyCompare on DateTime? {
  bool? isSameDate(DateTime? other) {
    // log("${Formatters.date(date: this)} - ${Formatters.date(date: other)}", name:"isSameDate");
    return this?.year == other?.year && this?.month == other?.month && this?.day == other?.day;
  }

  bool? isAnotherMonth(DateTime? other) {
    // log("${Formatters.date(date: this)} - ${Formatters.date(date: other)}", name:"isSameDate");
    return this?.year == other?.year && this?.month != other?.month;
  }

  bool isAfterYMD(DateTime? other) {
    if(other == null) return false;
    return this!.year > other.year || this!.month > other.month || this!.day > other.day;
  }

  bool isAfterOrSameYMD(DateTime? other) {
    if(other == null) return false;
    return this!.year >= other.year || this!.month >= other.month || this!.day >= other.day;
  }
}

extension DateOnlyCopyWith on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}