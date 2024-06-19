import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'm_post.g.dart';

@HiveType(typeId: 0)
class MPost extends Equatable {
  @HiveField(0)
  final String? after;
  @HiveField(1)
  final int? dist;
  @HiveField(2)
  final List<MPostData>? posts;

  const MPost({
    this.after,
    this.dist,
    this.posts,
  });

  factory MPost.fromJson(Map<String, dynamic>? json) => MPost(
        after: json?['data']?['after'] ?? "",
        dist: json?['data']?['dist'] ?? 0,
        posts: json?['data']?['children'] != null
            ? List<MPostData>.from((json?['data']['children'] ?? []).map((post) => MPostData.fromJson(post['data'])))
            : [],
      );

  @override
  List<Object?> get props => [
    after,
    dist,
    posts,
  ];
}

@HiveType(typeId: 1)
class MPostData extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? selfText;
  @HiveField(3)
  final String? url;

  const MPostData({
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

  @override
  List<Object?> get props => [
        id,
        title,
        selfText,
        url,
      ];
}
