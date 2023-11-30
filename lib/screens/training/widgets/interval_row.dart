import 'package:flutter/material.dart';

class IntervalRow extends StatelessWidget {
  final Widget widget;
  final int index;
  final int cyclesDone;
  final bool current;

  const IntervalRow(
      {required this.index,
      required this.widget,
      required this.cyclesDone,
      this.current = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          current ? "»${index + 1}" : " ${index + 1}",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        widget,
        Text(
          "$cyclesDone↻",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
