import 'package:hive/hive.dart';
import 'package:lepaya/modules/post/data/models/m_post.dart';
import 'package:lepaya/modules/post/data/sources/local_data_source/box_post.dart';
import 'package:lepaya/modules/post/data/sources/local_data_source/local_post.dart';

class LocalPostImp implements LocalPost {
  final BoxPost boxPost;

  LocalPostImp({
    required this.boxPost,
  });

  @override
  Future<void> delete(String type) async {
    await getBox(type).clear();
  }

  @override
  Future<void> deleteItem(String postId, String type) async {
    await getBox(type).delete(postId);
  }

  @override
  List<MPostData>? get(String type) => getBox(type).values.toList();

  @override
  MPostData? getItem(String postId, String type) => getBox(type).get(postId);

  @override
  Future<MPostData> setItem(MPostData post, String type) async {
    await getBox(type).put(post.id ?? "", post);
    return post;
  }

  @override
  Future<void> setItems(List<MPostData> posts, String type) async {
    for (var post in posts) {
      await getBox(type).put(post.id ?? "", post);
    }
  }

  Box<MPostData> getBox(String type) {
    switch (type) {
      case 'new':
        return boxPost.newPostsBox;
      case 'hot':
        return boxPost.hotPostsBox;
      case 'rising':
        return boxPost.risingPostsBox;
      default:
        throw ArgumentError('Invalid post type');
    }
  }
}
