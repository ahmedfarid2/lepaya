import 'package:lepaya/modules/post/data/models/m_post.dart';

abstract class RepoPost {
  Future<MPost?> getHotPosts({int limit = 25, String? after});
  Future<MPost?> getNewPosts({int limit = 25, String? after});
  Future<MPost?> getRisingPosts({int limit = 25, String? after});
}
