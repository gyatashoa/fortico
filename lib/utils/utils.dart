import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';

class Utils {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Color getLevelColor(double value) {
    if (value > 80) {
      return Colors.green;
    }

    if (value >= 50) {
      return Colors.yellow;
    }

    return Colors.red;
  }

  static String formatTime(DateTime date) {
    return GetTimeAgo.parse(date);
  }

  static String getPercentage(String val) {
    var percentage = (double.parse(val) / 200) * 100;
    return '${percentage.toInt()}%';
  }
}
