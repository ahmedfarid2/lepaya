import 'package:flutter_modular/flutter_modular.dart';
import 'package:lepaya/modules/post/data/repo_imp/repo_post_imp.dart';
import 'package:lepaya/modules/post/data/sources/local_data_source/box_post.dart';
import 'package:lepaya/modules/post/data/sources/local_data_source/local_post.dart';
import 'package:lepaya/modules/post/data/sources/local_data_source/local_post_imp.dart';
import 'package:lepaya/modules/post/data/sources/remote_data_source/remote_post.dart';
import 'package:lepaya/modules/post/data/sources/remote_data_source/remote_post_imp.dart';
import 'package:lepaya/modules/post/domain/repos/repo_post.dart';
import 'package:lepaya/modules/post/domain/usecases/use_case_get_hot_posts.dart';
import 'package:lepaya/modules/post/domain/usecases/use_case_get_new_posts.dart';
import 'package:lepaya/modules/post/domain/usecases/use_case_get_rising_posts.dart';
import 'package:lepaya/modules/post/domain/usecases/use_cases_posts.dart';
import 'package:lepaya/modules/post/presentation/state_managment/post_cubit.dart';

class BindPost {
  static void binds(Injector i) {
    /// Start [post] dependencies.
    /// [Box]
    i.addSingleton(BoxPost.new);

    /// [Data Sources]
    i.add<RemotePost>(RemotePostImp.new);
    i.add<LocalPost>(LocalPostImp.new);

    /// [Repo]
    i.add<RepoPost>(RepoPostImp.new);

    /// [UseCases]
    i.add(UseCasesPosts.new);
    i.add(UseCaseGetNewPosts.new);
    i.add(UseCaseGetHotPosts.new);
    i.add(UseCaseGetRisingPosts.new);

    /// [State Management]
    i.addLazySingleton<PostCubit>(PostCubit.new);
    /// End [Post] dependencies.
    /// [=================================================] ///
  }
}
