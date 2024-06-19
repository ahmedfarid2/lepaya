import 'package:lepaya/core/constants/constants.dart';
import 'package:lepaya/core/services/network/config/base_dio.dart';
import 'package:lepaya/core/services/network/config/end_points.dart';
import 'package:lepaya/core/utils/enums.dart';
import 'package:lepaya/core/utils/helpers/error_helper.dart';
import 'package:lepaya/modules/post/data/models/m_post.dart';
import 'package:lepaya/modules/post/data/sources/remote_data_source/remote_post.dart';

class RemotePostImp implements RemotePost {
  final BaseDio dio;

  RemotePostImp({
    required this.dio,
  });

  @override
  Future<MPost?> fetchNewPosts({int limit = 25, String? after}) async {
    try {
      final response = await dio.get(
        APIEndPoints.posts.getNewPosts(limit: limit, after: after),
      );
      if (Constants.constValues.successStatusCodes.contains(response.statusCode)) {
        return MPost.fromJson(response.data);
      } else {
        ErrorHelper.printDebugError(
          message: 'Unexpected status code: ${response.statusCode}',
          level: ErrorLevels.CRITICAL,
          name: 'RemotePostImp.fetchNewPosts',
          error: response.statusMessage,
        );
        return null;
      }
    } catch (e, stackTrace) {
      ErrorHelper.printDebugError(
        message: 'Error fetching new posts',
        level: ErrorLevels.ERROR,
        name: 'RemotePostImp.fetchNewPosts',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  @override
  Future<MPost?> fetchHotPosts({int limit = 25, String? after}) async {
    try {
      final response = await dio.get(
        APIEndPoints.posts.getHotPosts(limit: limit, after: after),
      );
      if (Constants.constValues.successStatusCodes.contains(response.statusCode)) {
        return MPost.fromJson(response.data);
      } else {
        ErrorHelper.printDebugError(
          message: 'Unexpected status code: ${response.statusCode}',
          level: ErrorLevels.CRITICAL,
          name: 'RemotePostImp.fetchHotPosts',
          error: response.statusMessage,
        );
        return null;
      }
    } catch (e, stackTrace) {
      ErrorHelper.printDebugError(
        message: 'Error fetching hot posts',
        level: ErrorLevels.ERROR,
        name: 'RemotePostImp.fetchHotPosts',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  @override
  Future<MPost?> fetchRisingPosts({int limit = 25, String? after}) async {
    try {
      final response = await dio.get(
        APIEndPoints.posts.getRisingPosts(limit: limit, after: after),
      );
      if (Constants.constValues.successStatusCodes.contains(response.statusCode)) {
        return MPost.fromJson(response.data);
      } else {
        ErrorHelper.printDebugError(
          message: 'Unexpected status code: ${response.statusCode}',
          level: ErrorLevels.CRITICAL,
          name: 'RemotePostImp.fetchRisingPosts',
          error: response.statusMessage,
        );
        return null;
      }
    } catch (e, stackTrace) {
      ErrorHelper.printDebugError(
        message: 'Error fetching rising posts',
        level: ErrorLevels.ERROR,
        name: 'RemotePostImp.fetchRisingPosts',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }
}
