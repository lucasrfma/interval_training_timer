import 'package:flutter/material.dart' hide Interval;
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:interval_training_timer/models/interval.dart';
import 'package:interval_training_timer/models/training.dart';
import 'package:interval_training_timer/screens/training/widgets/adjacent_interval.dart';
import 'package:interval_training_timer/screens/training/widgets/interval_row.dart';
import 'package:interval_training_timer/screens/training/widgets/timer_clock.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen(this.training, {super.key});
  final Training training;

  @override
  State<StatefulWidget> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  // to keep track which intervals to show
  int _currentIndex = 0;
  late int _previousIndex;
  late int _nextIndex;
  late int _lastIndex;
  late Interval _currentInterval;

  /// keep track of how many times each interval elapsed in this training session
  late List<int> _intervalCounters;

  int cyclesDone = 0;

  @override
  void initState() {
    super.initState();
    _lastIndex = widget.training.intervals.length - 1;
    _previousIndex = _lastIndex;
    _nextIndex = _calcNextIndex();
    _currentInterval = widget.training.intervals[_currentIndex];
    _intervalCounters = List.filled(widget.training.intervals.length, 0);
  }

  int _calcNextIndex() {
    return _currentIndex == _lastIndex ? 0 : _currentIndex + 1;
  }

  void _setOffAlarm() {
    FlutterRingtonePlayer.playAlarm(asAlarm: true);
    Future.delayed(_currentInterval.alarmDuration, () {
      FlutterRingtonePlayer.stop();
    });
  }

  void _timerFinished() {
    _setOffAlarm();
    setState(() {
      ++_intervalCounters[_currentIndex];

      _previousIndex = _currentIndex;
      _currentIndex = _calcNextIndex();
      _nextIndex = _calcNextIndex();

      _currentInterval = widget.training.intervals[_currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.training.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IntervalRow(
            index: _previousIndex,
            widget: AdjacentInterval(widget.training.intervals[_previousIndex]),
            cyclesDone: _intervalCounters[_previousIndex],
          ),
          IntervalRow(
            index: _currentIndex,
            widget: TimerClock(_currentInterval, _timerFinished),
            cyclesDone: _intervalCounters[_currentIndex],
            current: true,
          ),
          IntervalRow(
            index: _nextIndex,
            widget: AdjacentInterval(widget.training.intervals[_nextIndex]),
            cyclesDone: _intervalCounters[_nextIndex],
          ),
        ],
      ),
    );
  }
}
