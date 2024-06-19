import 'package:lepaya/modules/post/data/models/m_post.dart';

abstract class LocalPost {
  Future<void> delete(String type);
  Future<void> deleteItem(String postId, String type);

  List<MPostData>? get(String type);
  MPostData? getItem(String postId, String type);

  Future<MPostData> setItem(MPostData post, String type);
  Future<void> setItems(List<MPostData> posts, String type);
}
