part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

///[New post state]
final class GetAllNewPostLoading extends PostState {
  final bool isInitialLoad;
  GetAllNewPostLoading({required this.isInitialLoad});
}

final class GetAllNewPostSuccess extends PostState {
  final List<MPostData> posts;
  GetAllNewPostSuccess({required this.posts});
}

final class GetAllNewPostError extends PostState {}

///[Hot post state]
final class GetAllHotPostLoading extends PostState {
  final bool isInitialLoad;
  GetAllHotPostLoading({required this.isInitialLoad});
}

final class GetAllHotPostSuccess extends PostState {
  final List<MPostData> posts;
  GetAllHotPostSuccess({required this.posts});
}

final class GetAllHotPostError extends PostState {}

///[Rising post state]
final class GetAllRisingPostLoading extends PostState {
  final bool isInitialLoad;
  GetAllRisingPostLoading({required this.isInitialLoad});
}

final class GetAllRisingPostSuccess extends PostState {
  final List<MPostData> posts;
  GetAllRisingPostSuccess({required this.posts});
}

final class GetAllRisingPostError extends PostState {}


