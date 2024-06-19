import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TextStyleExtension on TextTheme {
  /// [Titles]
  TextStyle get titleBoldM_16 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        letterSpacing: 0.3.w,
        height: 24/16.h,
        fontFamily: 'Lato',
      );

  TextStyle get titleBoldS_14 => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    letterSpacing: 0.3.w,
    height: 20/14.h,
    fontFamily: 'Lato',
  );

  TextStyle get titleRegularS_14 => TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    letterSpacing: 0.3.w,
    height: 20/14.h,
    fontFamily: 'Lato',
  );
}
