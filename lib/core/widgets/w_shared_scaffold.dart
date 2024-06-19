import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lepaya/core/extension/color_extension.dart';
import 'package:lepaya/core/extension/context_extension.dart';
import 'package:lepaya/core/extension/text_theme_extension.dart';
import 'package:lepaya/modules/core/presentation/state_managment/app_core_cubit.dart';

class WSharedScaffold extends StatelessWidget {
  const WSharedScaffold({
    super.key,
    required this.body,
    this.title,
  });

  final String? title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCoreCubit, AppCoreState>(
      bloc: Modular.get<AppCoreCubit>(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.theme.colorScheme.naturalColor1,
          body: Column(
            children: [
              ///[app bar]
              Container(
                padding: EdgeInsets.only(
                  left: 10.w,
                  top: 57.h,
                  bottom: 7.h,
                ),
                color: context.theme.colorScheme.naturalColor0,
                width: 428.w,
                height: 88.h,
                child: Text(
                  title ?? "",
                  style: context.textTheme.titleBoldM_16.copyWith(
                    color: context.theme.colorScheme.naturalColor3,
                  ),
                ),
              ),

              ///[body]
              Expanded(
                child: body,
              ),
            ],
          ),
        );
      },
    );
  }
}
