class IntervalDefinition {
  final String name;
  final Duration duration;
  final Duration alarmDuration;

  IntervalDefinition(this.name, this.duration, {int alarmDuration = 8})
      : alarmDuration = Duration(seconds: alarmDuration);
}
