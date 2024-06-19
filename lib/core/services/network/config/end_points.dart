import 'package:lepaya/core/constants/constants.dart';
import 'package:lepaya/core/utils/enums.dart';

class APIEndPoints {
  static const String baseApiUrl = "https://www.reddit.com";
  static const String baseTestUrl = "https://www.reddit.com";

  static String get baseUrl => APIState.test == Constants.constValues.apiState ? baseTestUrl : baseApiUrl;

  static Posts posts = Posts();
}

class Posts {
  String basePosts = '/r/FlutterDev';

  String getHotPosts({int limit = 25, String? after}) {
    String afterQuery = after != null ? "&after=$after" : "";
    return "${APIEndPoints.baseUrl}$basePosts/hot.json?limit=$limit$afterQuery";
  }

  String getNewPosts({int limit = 25, String? after}) {
    String afterQuery = after != null ? "&after=$after" : "";
    return "${APIEndPoints.baseUrl}$basePosts/new.json?limit=$limit$afterQuery";
  }

  String getRisingPosts({int limit = 25, String? after}) {
    String afterQuery = after != null ? "&after=$after" : "";
    return "${APIEndPoints.baseUrl}$basePosts/rising.json?limit=$limit$afterQuery";
  }
}
