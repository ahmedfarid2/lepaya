import 'package:flutter_modular/flutter_modular.dart';
import 'package:lepaya/core/services/network/config/base_dio.dart';
import 'package:lepaya/core/services/routes/binds/bind_post.dart';
import 'package:lepaya/modules/core/presentation/state_managment/app_core_cubit.dart';

/// [Binds] is a class that contains all the dependencies that will be used in the app.
class Binds {
  /// [binds] is a function that bind all dependencies.
  static void binds(Injector i) {
    // ========== Clean Arch ========== //
    /// Start [Global] dependencies.
    /// Here is the global or configurable dependencies that are used in all other dependencies.
    i.addSingleton(BaseDio.new);
    i.addSingleton(AppCoreCubit.new);

    /// End [Global] dependencies.
    /// [=================================================] ///

    /// [Post]
    BindPost.binds(i);
  }
}
