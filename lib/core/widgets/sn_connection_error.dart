import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lepaya/core/assets/assets.gen.dart';
import 'package:lepaya/core/extension/color_extension.dart';
import 'package:lepaya/core/extension/context_extension.dart';
import 'package:lepaya/core/extension/int_extension.dart';
import 'package:lepaya/core/extension/text_theme_extension.dart';
import 'package:lepaya/core/widgets/w_shared_scaffold.dart';

class SNConnectionError extends StatelessWidget {
  const SNConnectionError({super.key});

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      title: "Connection Error",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.noInternet.path,
            width: 200.w,
            height: 200.h,
            colorFilter: ColorFilter.mode(
              context.theme.colorScheme.naturalColor3.withOpacity(0.4),
              BlendMode.srcIn,
            ),
          ),
          32.createVerticalGap,
          Text(
            "No internet connection",
            style: context.textTheme.titleBoldM_16.copyWith(
              color: context.theme.colorScheme.naturalColor3,
            ),
          ),
          16.createVerticalGap,
          InkWell(
            onTap: () => Modular.to.pop(),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: context.theme.colorScheme.primary,
                  width: 1.w,
                ),
              ),
              child: Text(
                "Press to Back",
                style: context.textTheme.titleBoldS_14.copyWith(
                  color: context.theme.colorScheme.naturalColor3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
