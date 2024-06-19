import 'package:flutter_modular/flutter_modular.dart';
import 'package:lepaya/modules/post/domain/usecases/use_case_get_hot_posts.dart';
import 'package:lepaya/modules/post/domain/usecases/use_case_get_new_posts.dart';
import 'package:lepaya/modules/post/domain/usecases/use_case_get_rising_posts.dart';

class UseCasesPosts {
  final UseCaseGetNewPosts getNewPosts = Modular.get<UseCaseGetNewPosts>();
  final UseCaseGetHotPosts getHotPosts = Modular.get<UseCaseGetHotPosts>();
  final UseCaseGetRisingPosts getRisingPosts = Modular.get<UseCaseGetRisingPosts>();
}
