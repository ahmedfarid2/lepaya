import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lepaya/core/assets/assets.gen.dart';
import 'package:lepaya/core/extension/color_extension.dart';
import 'package:lepaya/core/extension/context_extension.dart';
import 'package:lepaya/core/extension/int_extension.dart';
import 'package:lepaya/core/extension/text_theme_extension.dart';
import 'package:lepaya/core/widgets/w_shared_scaffold.dart';

class SNUndefinedRoute extends StatelessWidget {
  const SNUndefinedRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      title: "Undefined Route",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.undefined.path,
            width: 300.w,
            height: 300.h,
          ),
          32.createVerticalGap,
          Text(
            "Undefined Route",
            style: context.textTheme.titleBoldM_16.copyWith(
              color: context.theme.colorScheme.naturalColor3,
            ),
          ),
        ],
      ),
    );
  }
}
