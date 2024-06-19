import 'package:flutter/material.dart';
import 'package:lepaya/core/extension/color_extension.dart';
import 'package:lepaya/core/extension/context_extension.dart';
import 'package:lepaya/core/extension/text_theme_extension.dart';
import 'package:lepaya/core/widgets/w_shared_scaffold.dart';

class SNUndefinedRoute extends StatelessWidget {
  const SNUndefinedRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      title: "Undefined Route",
      body: Center(
        child: Text(
          "Undefined Route",
          style: context.textTheme.titleBoldM_16.copyWith(
            color: context.theme.colorScheme.naturalColor2,
          ),
        ),
      ),
    );
  }
}
