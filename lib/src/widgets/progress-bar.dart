import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final int currentProgress;
  final int totalProgress;

  const ProgressWidget({
    Key? key,
    required this.currentProgress,
    required this.totalProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progressPercentage = currentProgress / totalProgress;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$currentProgress/$totalProgress',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 200,
          height: 8,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: [
              Container(
                width: 200 * progressPercentage,
                height: 8,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
