import 'package:flutter/material.dart';
import 'package:interval_training_timer/models/interval_definition.dart';
import 'package:interval_training_timer/models/training_definition.dart';
import 'package:interval_training_timer/widgets/interval_timer/timer_clock.dart';

class TrainingHome extends StatefulWidget {
  const TrainingHome(this.training, {super.key});
  final TrainingDefinition training;

  @override
  State<StatefulWidget> createState() => TrainingHomeState();
}

class TrainingHomeState extends State<TrainingHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimerClock(widget.training.intervals[0]),
      ],
    );
  }
}
