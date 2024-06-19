import 'package:lepaya/core/utils/usecases/base_usecase.dart';
import 'package:lepaya/core/utils/usecases/pagination_params.dart';
import 'package:lepaya/modules/post/data/models/m_post.dart';
import 'package:lepaya/modules/post/domain/repos/repo_post.dart';

class UseCaseGetNewPosts extends BaseUseCase<Future<MPost?>, PaginationParams> {
  final RepoPost repo;

  UseCaseGetNewPosts({
    required this.repo,
  });

  @override
  Future<MPost?> call(input) => repo.getNewPosts(limit: input.limit, after: input.after);
}
