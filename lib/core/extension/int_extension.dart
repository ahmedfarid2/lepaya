import 'package:flutter/material.dart';

extension IntExtension on int {
  SizedBox get createHorizontalGap => SizedBox(
        width: toDouble(),
      );

  SizedBox get createVerticalGap => SizedBox(
        height: toDouble(),
      );
}
