import 'package:flutter_modular/flutter_modular.dart';
import 'package:lepaya/core/constants/constants.dart';
import 'package:lepaya/core/services/routes/routes_names.dart';
import 'package:lepaya/core/utils/enums.dart';
import 'package:lepaya/core/utils/helpers/error_helper.dart';
import 'package:lepaya/modules/post/data/models/m_post.dart';
import 'package:lepaya/modules/post/data/sources/local_data_source/local_post.dart';
import 'package:lepaya/modules/post/data/sources/remote_data_source/remote_post.dart';
import 'package:lepaya/modules/post/domain/repos/repo_post.dart';

class RepoPostImp implements RepoPost {
  final RemotePost remotePost;
  final LocalPost localPost;

  RepoPostImp({
    required this.remotePost,
    required this.localPost,
  });

  @override
  Future<MPost?> getNewPosts({int limit = 25, String? after}) async {
    if (isConnected()) {
      try {
        final MPost? posts = await remotePost.fetchNewPosts(limit: limit, after: after);
        if (posts != null) {
          await localPost.setItems(posts.posts ?? [], 'new');
          return posts;
        }
      } catch (e, stackTrace) {
        ErrorHelper.printDebugError(
          message: 'Error fetching new posts',
          level: ErrorLevels.ERROR,
          name: 'RepoPostImp.getNewPosts',
          error: e,
          stackTrace: stackTrace,
        );
      }
    }

    final localPosts = localPost.get('new');
    if (localPosts != null && localPosts.isNotEmpty) {
      return MPost(posts: localPosts);
    } else {
      Modular.to.pushNamed(RoutesNames.connectionError);
      return null;
    }
  }

  @override
  Future<MPost?> getHotPosts({int limit = 25, String? after}) async {
    if (isConnected()) {
      try {
        final MPost? posts = await remotePost.fetchHotPosts(limit: limit, after: after);
        if (posts != null) {
          await localPost.setItems(posts.posts ?? [], 'hot');
          return posts;
        }
      } catch (e, stackTrace) {
        ErrorHelper.printDebugError(
          message: 'Error fetching hot posts',
          level: ErrorLevels.ERROR,
          name: 'RepoPostImp.getHotPosts',
          error: e,
          stackTrace: stackTrace,
        );
      }
    }

    final localPosts = localPost.get('hot');
    if (localPosts != null && localPosts.isNotEmpty) {
      return MPost(posts: localPosts);
    } else {
      Modular.to.pushNamed(RoutesNames.connectionError);
      return null;
    }
  }

  @override
  Future<MPost?> getRisingPosts({int limit = 25, String? after}) async {
    if (isConnected()) {
      try {
        final MPost? posts = await remotePost.fetchRisingPosts(limit: limit, after: after);
        if (posts != null) {
          await localPost.setItems(posts.posts ?? [], 'rising');
          return posts;
        }
      } catch (e, stackTrace) {
        ErrorHelper.printDebugError(
          message: 'Error fetching rising posts',
          level: ErrorLevels.ERROR,
          name: 'RepoPostImp.getRisingPosts',
          error: e,
          stackTrace: stackTrace,
        );
      }
    }

    final localPosts = localPost.get('rising');
    if (localPosts != null && localPosts.isNotEmpty) {
      return MPost(posts: localPosts);
    } else {
      Modular.to.pushNamed(RoutesNames.connectionError);
      return null;
    }
  }

  bool isConnected() {
    return !Constants.constValues.isNetworkDisconnected;
  }
}
