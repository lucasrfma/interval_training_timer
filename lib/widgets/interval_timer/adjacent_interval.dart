import 'package:flutter/material.dart';
import 'package:interval_training_timer/models/interval_definition.dart';

class AdjacentInterval extends StatelessWidget {
  const AdjacentInterval(this.interval, {super.key});

  final IntervalDefinition interval;

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
          interval.duration.toString().split(".").first.padLeft(8, "0"),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
