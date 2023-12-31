import 'dart:async';

import 'package:flutter/material.dart' hide Interval;
import 'package:interval_training_timer/models/interval.dart';

class TimerClock extends StatefulWidget {
  final Interval interval;
  final void Function() onTimerFinished;

  const TimerClock(this.interval, this.onTimerFinished, {super.key});

  @override
  State<StatefulWidget> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  late String _bigTimeLeft;
  late String _smallTimeLeft;
  late String _name;
  Timer? timer;
  static const refreshRate = Duration(milliseconds: 10);
  final stopwatch = Stopwatch();
  bool ready = true;

  void _updateTimeLeft(Duration duration) {
    var timeSplit = duration.toString().split(".");
    _bigTimeLeft = timeSplit.first.padLeft(8, "0");
    _smallTimeLeft = timeSplit.last.substring(0, 2);
  }

  @override
  void initState() {
    super.initState();
    _name = widget.interval.name;
    _updateTimeLeft(widget.interval.duration);
  }

  @override
  void didUpdateWidget(covariant TimerClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    stopwatch.reset();
    ready = true;
    _name = widget.interval.name;
    _updateTimeLeft(widget.interval.duration);
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
    setState(() {
      stopwatch.stop();
    });
    timer?.cancel();
  }

  void _resetCountdown() {
    setState(() {
      _updateTimeLeft(widget.interval.duration);
      stopwatch.reset();
    });
  }

  void _finishInterval() {
    ready = false;
    widget.onTimerFinished();
  }

  void _updateClock(Timer t) {
    if (ready) {
      var durationLeft = widget.interval.duration - stopwatch.elapsed;
      if (durationLeft < Duration.zero) {
        _finishInterval();
      } else {
        setState(() {
          _updateTimeLeft(durationLeft);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _name,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
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
            stopwatch.isRunning
                ? ElevatedButton.icon(
                    onPressed: _stopCountdown,
                    icon: const Icon(Icons.stop),
                    label: const Text("Stop"),
                  )
                : ElevatedButton.icon(
                    onPressed: _resetCountdown,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Reset"),
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
