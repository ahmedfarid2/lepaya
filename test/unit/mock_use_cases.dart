import 'package:lepaya/modules/post/domain/usecases/use_case_get_hot_posts.dart';
import 'package:lepaya/modules/post/domain/usecases/use_case_get_new_posts.dart';
import 'package:lepaya/modules/post/domain/usecases/use_case_get_rising_posts.dart';
import 'package:mockito/annotations.dart';
import 'package:lepaya/modules/post/domain/usecases/use_cases_posts.dart';

@GenerateMocks([
  UseCasesPosts,
  UseCaseGetHotPosts,
  UseCaseGetNewPosts,
  UseCaseGetRisingPosts,
])
void main() {}
