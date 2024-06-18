import 'package:hive/hive.dart';

part 'm_post.g.dart';

@HiveType(typeId: 0)
class MPost {
  @HiveField(0)
  final String? after;
  @HiveField(1)
  final int? dist;
  @HiveField(2)
  final List<MPostData>? posts;

  MPost({
    this.after,
    this.dist,
    this.posts,
  });

  factory MPost.fromJson(Map<String, dynamic>? json) => MPost(
        after: json?['data']?['after'] ?? "",
        dist: json?['data']?['dist'] ?? 0,
        posts: json?['data']?['children'] != null
            ? List<MPostData>.from(
                (json?['data']['children'] ?? []).map((post) => MPostData.fromJson(post['data'])))
            : [],
      );
}

@HiveType(typeId: 1)
class MPostData {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? selfText;
  @HiveField(3)
  final String? url;

  MPostData({
    this.id,
    this.title,
    this.selfText,
    this.url,
  });

  factory MPostData.fromJson(Map<String, dynamic>? json) => MPostData(
        id: json?['id'] ?? '',
        title: json?['title'] ?? '',
        selfText: json?['selftext'] ?? '',
        url: json?['url'] ?? '',
      );
}
