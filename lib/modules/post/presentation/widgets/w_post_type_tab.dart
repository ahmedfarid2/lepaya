import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lepaya/core/extension/color_extension.dart';
import 'package:lepaya/core/extension/context_extension.dart';
import 'package:lepaya/core/extension/text_theme_extension.dart';

class WPostTypeTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const WPostTypeTab({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = isSelected
        ? context.textTheme.titleBoldS_14.copyWith(
            color: context.theme.colorScheme.naturalColor3.withOpacity(0.87),
          )
        : context.textTheme.titleRegularS_14.copyWith(
            color: context.theme.colorScheme.naturalColor3.withOpacity(0.6),
          );
    final indicatorColor =
        isSelected ? context.theme.colorScheme.primaryColor : context.theme.colorScheme.naturalColor2;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 11.h,
              bottom: 12.h,
            ),
            child: Text(
              label,
              style: textStyle,
            ),
          ),
          Container(
            height: 2.h,
            width: 142.66.w,
            color: indicatorColor,
          ),
        ],
      ),
    );
  }
}
