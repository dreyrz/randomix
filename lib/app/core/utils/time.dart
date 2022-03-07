enum Period {
  morning,
  afternoon,
  night,
  dawn,
}

class Time {
  static Period currentPeriod() {
    final hour = DateTime.now().hour;

    if (hour >= 6 && hour < 12) {
      return Period.morning;
    } else if (hour >= 12 && hour < 18) {
      return Period.afternoon;
    } else if (hour >= 18 && hour <= 23) {
      return Period.night;
    } else {
      return Period.dawn;
    }
  }
}
