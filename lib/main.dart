import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lepaya/app_bloc_observer.dart';
import 'package:lepaya/core/services/routes/app_module.dart';
import 'package:lepaya/modules/core/presentation/screens/app_core.dart';
import 'package:lepaya/modules/post/data/models/m_post.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  await ScreenUtil.ensureScreenSize();

  Hive
    ..registerAdapter(MPostAdapter())
    ..registerAdapter(MPostDataAdapter());

  await Hive.initFlutter();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppCore(),
    ),
  );
}