import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lepaya/core/extension/color_extension.dart';
import 'package:lepaya/core/extension/context_extension.dart';
import 'package:lepaya/core/extension/int_extension.dart';
import 'package:lepaya/core/extension/text_theme_extension.dart';
import 'package:lepaya/core/utils/helpers/helper_url_luncher.dart';

class WPostItem extends StatelessWidget {
  final String? title;
  final String? content;
  final String? url;

  const WPostItem({
    super.key,
    this.title,
    this.content,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await HelperUrlLauncher.launchPost(url ?? ""),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        padding: EdgeInsets.only(
          top: 12.h,
          bottom: 16.h,
          left: 16.w,
          right: 16.w,
        ),
        width: 396.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.naturalColor0,
          border: Border(
            top: BorderSide(
              color: context.theme.colorScheme.secondaryColor,
              width: 4.0.w,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: context.theme.colorScheme.shadowColor.withOpacity(0.08),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "",
              style: context.textTheme.titleBoldS_14.copyWith(
                color: context.theme.colorScheme.naturalColor3,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            8.createVerticalGap,
            Text(
              content ?? "",
              style: context.textTheme.titleRegularS_14.copyWith(
                color: context.theme.colorScheme.naturalColor3.withOpacity(0.87),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}