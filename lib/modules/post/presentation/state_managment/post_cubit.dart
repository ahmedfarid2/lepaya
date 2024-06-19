import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lepaya/core/utils/enums.dart';
import 'package:lepaya/core/utils/helpers/error_helper.dart';
import 'package:lepaya/core/utils/usecases/pagination_params.dart';
import 'package:lepaya/modules/post/data/models/m_post.dart';
import 'package:lepaya/modules/post/domain/usecases/use_cases_posts.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final UseCasesPosts useCasesPosts;
  final ScrollController scrollController = ScrollController();

  PostCubit({
    required this.useCasesPosts,
    bool loadHotPostsInitially = true,
  }) : super(PostInitial()) {
    if (loadHotPostsInitially) {
      getAllHotPosts();
    }
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      loadMorePosts();
    }
  }

  void resetScrollPosition() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }

  @override
  Future<void> close() {
    scrollController.removeListener(onScroll);
    if (scrollController.hasClients) {
      scrollController.dispose();
    }
    return super.close();
  }

  List<MPostData> newPosts = [];
  List<MPostData> hotPosts = [];
  List<MPostData> risingPosts = [];

  String? newAfter;
  String? hotAfter;
  String? risingAfter;

  TabType selectedTab = TabType.Hot;

  bool hasLoadedNewPosts = false;
  bool hasLoadedHotPosts = false;
  bool hasLoadedRisingPosts = false;

  Future<void> getAllNewPosts({bool isPagination = false}) async {
    if (!isPagination && hasLoadedNewPosts) return;
    emit(GetAllNewPostLoading(isInitialLoad: newPosts.isEmpty));

    try {
      final activePosts = await useCasesPosts.getNewPosts(PaginationParams(limit: 25, after: newAfter));
      if (activePosts == null) {
        emit(GetAllNewPostError());
        return;
      }

      if (isPagination && activePosts.after == "") {
        emit(PostsFullyLoaded());
        return;
      }

      newAfter = activePosts.after;
      newPosts.addAll(activePosts.posts ?? []);
      hasLoadedNewPosts = true;
      emit(GetAllNewPostSuccess(posts: newPosts));
    } catch (e, stackTrace) {
      ErrorHelper.printDebugError(
        message: 'Error fetching new posts',
        level: ErrorLevels.ERROR,
        name: 'PostCubit.getAllNewPosts',
        error: e,
        stackTrace: stackTrace,
      );
      emit(GetAllNewPostError());
    }
  }

  Future<void> getAllHotPosts({bool isPagination = false}) async {
    if (!isPagination && hasLoadedHotPosts) return;
    emit(GetAllHotPostLoading(isInitialLoad: hotPosts.isEmpty));

    try {
      final activePosts = await useCasesPosts.getHotPosts(PaginationParams(limit: 25, after: hotAfter));
      if (activePosts == null) {
        emit(GetAllNewPostError());
        return;
      }

      if (isPagination && activePosts.after == "") {
        emit(PostsFullyLoaded());
        return;
      }

      hotAfter = activePosts.after;
      hotPosts.addAll(activePosts.posts ?? []);
      hasLoadedHotPosts = true;
      emit(GetAllHotPostSuccess(posts: hotPosts));
    } catch (e, stackTrace) {
      ErrorHelper.printDebugError(
        message: 'Error fetching hot posts',
        level: ErrorLevels.ERROR,
        name: 'PostCubit.getAllHotPosts',
        error: e,
        stackTrace: stackTrace,
      );
      emit(GetAllHotPostError());
    }
  }

  Future<void> getAllRisingPosts({bool isPagination = false}) async {
    if (!isPagination && hasLoadedRisingPosts) return;
    emit(GetAllRisingPostLoading(isInitialLoad: risingPosts.isEmpty));

    try {
      final activePosts = await useCasesPosts.getRisingPosts(PaginationParams(limit: 25, after: risingAfter));
      if (activePosts == null) {
        emit(GetAllNewPostError());
        return;
      }

      if (isPagination && activePosts.after == "") {
        emit(PostsFullyLoaded());
        return;
      }

      risingAfter = activePosts.after;
      risingPosts.addAll(activePosts.posts ?? []);
      hasLoadedRisingPosts = true;
      emit(GetAllRisingPostSuccess(posts: risingPosts));
    } catch (e, stackTrace) {
      ErrorHelper.printDebugError(
        message: 'Error fetching rising posts',
        level: ErrorLevels.ERROR,
        name: 'PostCubit.getAllRisingPosts',
        error: e,
        stackTrace: stackTrace,
      );
      emit(GetAllRisingPostError());
    }
  }

  void selectTab(TabType tab) {
    selectedTab = tab;
    emit(TabChanged(tab: tab));
    resetScrollPosition();
    switch (tab) {
      case TabType.New:
        getAllNewPosts();
        break;
      case TabType.Hot:
        getAllHotPosts();
        break;
      case TabType.Rising:
        getAllRisingPosts();
        break;
    }
  }

  void loadMorePosts() {
    switch (selectedTab) {
      case TabType.New:
        getAllNewPosts(isPagination: true);
        break;
      case TabType.Hot:
        getAllHotPosts(isPagination: true);
        break;
      case TabType.Rising:
        getAllRisingPosts(isPagination: true);
        break;
    }
  }
}
