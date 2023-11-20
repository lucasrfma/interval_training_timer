import 'package:flutter/material.dart';

class TimerClock extends StatefulWidget {
  final Duration totalDuration;

  const TimerClock(
    this.totalDuration, {
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("00:00:00"),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.stop),
              label: const Text("Stop"),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: const Text("Start"),
            )
          ],
        )
      ],
    );
  }
}
