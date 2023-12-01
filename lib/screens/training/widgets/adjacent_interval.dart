import 'package:flutter/material.dart' hide Interval;
import 'package:interval_training_timer/models/interval.dart';
import 'package:interval_training_timer/utils/utils.dart';

class AdjacentInterval extends StatelessWidget {
  const AdjacentInterval(this.interval, {super.key});

  final Interval interval;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          interval.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          durationClockFormat(interval.duration),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
