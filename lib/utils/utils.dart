import 'package:flutter/material.dart';

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
}
