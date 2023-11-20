import 'dart:async';

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
  late String _bigTimeLeft;
  late String _smallTimeLeft;
  Timer? timer;
  static const refreshRate = Duration(milliseconds: 10);
  final stopwatch = Stopwatch();
  var startable = true;

  void _updateTimeLeft(Duration duration) {
    var timeSplit = duration.toString().split(".");
    _bigTimeLeft = timeSplit.first.padLeft(8, "0");
    _smallTimeLeft = timeSplit.last.substring(0, 2);
  }

  @override
  void initState() {
    super.initState();
    _updateTimeLeft(widget.totalDuration);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    stopwatch.start();
    timer = Timer.periodic(refreshRate, _updateClock);
  }

  void _stopCountdown() {
    stopwatch.stop();
    timer?.cancel();
  }

  void _updateClock(Timer t) {
    var durationLeft = widget.totalDuration - stopwatch.elapsed;
    setState(() {
      if (durationLeft < Duration.zero) {
        _stopCountdown();
        durationLeft = Duration.zero;
        startable = false;
      }
      _updateTimeLeft(durationLeft);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _bigTimeLeft,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              _smallTimeLeft,
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _stopCountdown,
              icon: const Icon(Icons.stop),
              label: const Text("Stop"),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton.icon(
              onPressed: _startCountdown,
              icon: const Icon(Icons.play_arrow),
              label: const Text("Start"),
            )
          ],
        )
      ],
    );
  }
}
