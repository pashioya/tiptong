// progress_model.dart
import 'package:flutter/material.dart';

class ProgressModel extends ChangeNotifier {
  int currentProgress = 6;
  int totalProgress = 20;

  // Calculate the percentage of progress
  double get progressPercentage {
    if (totalProgress == 0) return 0.0;
    return currentProgress / totalProgress;
  }

  // Update progress
  void updateProgress(int newProgress) {
    currentProgress = newProgress;
    notifyListeners();
  }

  // Called when widget updates
  void onUpdate() {
    // Logic for updating or recalculating can go here
    notifyListeners();
  }

  // Handle disposal if necessary
  void maybeDispose() {
    // Clean up resources if needed
  }
}
