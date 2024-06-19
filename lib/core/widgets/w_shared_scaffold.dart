import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
          appBar: AppBar(),
          body: Stack(
            children: [
              Column(
                children: <Widget>[
                  Expanded(
                    child: body,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
