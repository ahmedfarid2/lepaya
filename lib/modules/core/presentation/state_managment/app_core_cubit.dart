import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_core_state.dart';

class AppCoreCubit extends Cubit<AppCoreState> {
  AppCoreCubit() : super(AppCoreInitial());
}
