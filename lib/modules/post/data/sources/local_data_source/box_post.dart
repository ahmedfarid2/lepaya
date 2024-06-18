import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:lepaya/core/utils/helpers/helper_hive.dart';
import 'package:lepaya/modules/post/data/models/m_post.dart';

class BoxPost {
  late Box<MPostData> _newPostsBox;
  late Box<MPostData> _hotPostsBox;
  late Box<MPostData> _risingPostsBox;

  final String _newPostsBoxName = 'new_posts_box';
  final String _hotPostsBoxName = 'hot_posts_box';
  final String _risingPostsBoxName = 'rising_posts_box';

  /// [box] is the box for the post.
  Box<MPostData> get newPostsBox => _newPostsBox;
  Box<MPostData> get hotPostsBox => _hotPostsBox;
  Box<MPostData> get risingPostsBox => _risingPostsBox;

  Future<void> init() async {
    _newPostsBox = await HelperHive.tryInitBox<MPostData>(_newPostsBoxName);
    _hotPostsBox = await HelperHive.tryInitBox<MPostData>(_hotPostsBoxName);
    _risingPostsBox = await HelperHive.tryInitBox<MPostData>(_risingPostsBoxName);
    debugPrint('Hive.Box.open: $_newPostsBoxName -- Length: ${_newPostsBox.length}');
    debugPrint('Hive.Box.open: $_hotPostsBoxName -- Length: ${_hotPostsBox.length}');
    debugPrint('Hive.Box.open: $_risingPostsBoxName -- Length: ${_risingPostsBox.length}');
  }
}
