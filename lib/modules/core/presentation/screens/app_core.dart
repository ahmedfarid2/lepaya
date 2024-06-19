import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lepaya/core/constants/constants.dart';
import 'package:lepaya/core/services/routes/app_modular_opserver.dart';
import 'package:lepaya/core/services/routes/routes_names.dart';
import 'package:lepaya/core/theme/app_theme.dart';
import 'package:lepaya/core/utils/enums.dart';
import 'package:lepaya/core/utils/helpers/error_helper.dart';
import 'package:lepaya/modules/core/presentation/state_managment/app_core_cubit.dart';
import 'package:lepaya/modules/post/data/sources/local_data_source/box_post.dart';
import 'package:lepaya/modules/post/presentation/state_managment/post_cubit.dart';
import 'package:palestine_connection/palestine_connection.dart';

class AppCore extends StatefulWidget {
  const AppCore({super.key});

  @override
  State<AppCore> createState() => _AppCoreState();
}

class _AppCoreState extends State<AppCore> {
  @override
  void initState() {
    super.initState();

    try {
      PalConnection().initialize(
        domain: PalDomain.google,
        periodicInSeconds: 1,
        onConnectionLost: () {
          /// If the internet connection was working, Do that.
          /// to prevent the method to be called more than one
          Constants.constValues.isNetworkDisconnected = true;
        },
        onConnectionRestored: () {
          if (Constants.constValues.isNetworkDisconnected) {
            Constants.constValues.isNetworkDisconnected = false;
            if (Modular.to.path == RoutesNames.connectionError) {
              Modular.to.pop();
            }
          }
        },
      );
    } catch (e, stackTrace) {
      ErrorHelper.printDebugError(
        message: 'Error initializing connection checker',
        level: ErrorLevels.ERROR,
        name: 'AppCore.initializeConnectionChecker',
        error: e,
        stackTrace: stackTrace,
      );
    }

    Future.wait([
      Modular.get<BoxPost>().init(),
    ]);

    Modular.to.setObservers([
      AppModularObserver(),
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppCoreCubit>(
              create: (BuildContext context) => AppCoreCubit(),
            ),
            BlocProvider<PostCubit>(
              create: (BuildContext context) => Modular.get<PostCubit>(),
            ),
          ],
          child: MaterialApp.router(
            title: Constants.constValues.appName,
            theme: AppTheme.lightTheme(),
            debugShowCheckedModeBanner: false,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
            builder: (BuildContext context, Widget? child) {
              return child ?? Container();
            },
          ),
        );
      },
    );
  }
}
