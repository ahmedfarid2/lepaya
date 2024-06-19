class RoutesNames {
  static String get appInit => '/';
  static String get connectionError => '/connection-error';
  static final HomeRoutes home = HomeRoutes();
  static final PostRoutes post = PostRoutes();
}

class HomeRoutes {
  String get homeMain => '/home';
}

class PostRoutes {
  String basePost = '/post';
  String get retrievePosts => '$basePost/list';
}


