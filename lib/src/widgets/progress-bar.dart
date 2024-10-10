import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final int currentProgress;
  final int totalProgress;

  const ProgressWidget({
    super.key,
    required this.currentProgress,
    required this.totalProgress,
  });

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
              color: Theme.of(context).colorScheme.primary, fontSize: 15),
        ),
        const SizedBox(height: 8),
        Container(
          width: 100,
          height: 8,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
