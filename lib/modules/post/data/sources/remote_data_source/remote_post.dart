
import 'package:lepaya/modules/post/data/models/m_post.dart';

abstract class RemotePost {
  Future<MPost?> fetchHotPosts({int limit, String? after});
  Future<MPost?> fetchNewPosts({int limit, String? after});
  Future<MPost?> fetchRisingPosts({int limit, String? after});
}
