import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:interval_training_timer/models/interval_definition.dart';
import 'package:interval_training_timer/models/training_definition.dart';
import 'package:interval_training_timer/widgets/interval_timer/adjacent_interval.dart';
import 'package:interval_training_timer/widgets/interval_timer/timer_clock.dart';
import 'package:interval_training_timer/widgets/interval_timer/timer_row.dart';

class TrainingHome extends StatefulWidget {
  const TrainingHome(this.training, {super.key});
  final TrainingDefinition training;

  @override
  State<StatefulWidget> createState() => _TrainingHomeState();
}

class _TrainingHomeState extends State<TrainingHome> {
  // to keep track which intervals to show
  int _currentIndex = 0;
  late int _previousIndex;
  late int _nextIndex;
  late int _lastIndex;
  late IntervalDefinition _currentInterval;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TimerRow(
          index: _previousIndex,
          widget: AdjacentInterval(widget.training.intervals[_previousIndex]),
          cyclesDone: _intervalCounters[_previousIndex],
        ),
        TimerRow(
          index: _currentIndex,
          widget: TimerClock(_currentInterval, _timerFinished),
          cyclesDone: _intervalCounters[_currentIndex],
          current: true,
        ),
        TimerRow(
          index: _nextIndex,
          widget: AdjacentInterval(widget.training.intervals[_nextIndex]),
          cyclesDone: _intervalCounters[_nextIndex],
        ),
      ],
    );
  }
}
