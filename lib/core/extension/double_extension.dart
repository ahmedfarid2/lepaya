import 'package:flutter/material.dart';

extension DoubleExtension on double {
  SizedBox get createHorizontalGap => SizedBox(
    width: this,
  );

  SizedBox get createVerticalGap => SizedBox(
    height: this,
  );
}
