String durationClockFormat(Duration duration) {
  return duration.toString().split(".").first.padLeft(8, "0");
}
