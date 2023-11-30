class Interval {
  final String name;
  final Duration duration;
  final Duration alarmDuration;

  Interval(this.name, this.duration, {int alarmDuration = 8})
      : alarmDuration = Duration(seconds: alarmDuration);
}
