part of 'post_cubit.dart';

@immutable
abstract class PostState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class PostInitial extends PostState {}

///[New post state]
final class GetAllNewPostLoading extends PostState {
  final bool isInitialLoad;
  GetAllNewPostLoading({required this.isInitialLoad});

  @override
  List<Object?> get props => [isInitialLoad];
}

final class GetAllNewPostSuccess extends PostState {
  final List<MPostData> posts;
  GetAllNewPostSuccess({required this.posts});

  @override
  List<Object?> get props => [posts];
}

final class GetAllNewPostError extends PostState {}

///[Hot post state]
final class GetAllHotPostLoading extends PostState {
  final bool isInitialLoad;
  GetAllHotPostLoading({required this.isInitialLoad});

  @override
  List<Object?> get props => [isInitialLoad];
}

final class GetAllHotPostSuccess extends PostState {
  final List<MPostData> posts;
  GetAllHotPostSuccess({required this.posts});

  @override
  List<Object?> get props => [posts];
}

final class GetAllHotPostError extends PostState {}

///[Rising post state]
final class GetAllRisingPostLoading extends PostState {
  final bool isInitialLoad;
  GetAllRisingPostLoading({required this.isInitialLoad});

  @override
  List<Object?> get props => [isInitialLoad];
}

final class GetAllRisingPostSuccess extends PostState {
  final List<MPostData> posts;
  GetAllRisingPostSuccess({required this.posts});

  @override
  List<Object?> get props => [posts];
}

final class GetAllRisingPostError extends PostState {}

///[posts full load]
final class PostsFullyLoaded extends PostState {}

///[tab state]
final class TabChanged extends PostState {
  final TabType tab;
  TabChanged({required this.tab});

  @override
  List<Object?> get props => [tab];
}



