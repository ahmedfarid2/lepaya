import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lepaya/core/utils/enums.dart';
import 'package:lepaya/core/utils/helpers/error_helper.dart';
import 'package:lepaya/core/utils/usecases/pagination_params.dart';
import 'package:lepaya/modules/post/data/models/m_post.dart';
import 'package:lepaya/modules/post/domain/usecases/use_cases_posts.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final UseCasesPosts useCasesPosts;

  PostCubit({
    required this.useCasesPosts,
  }) : super(PostInitial());

  List<MPostData> newPosts = [];
  List<MPostData> hotPosts = [];
  List<MPostData> risingPosts = [];
  String? newAfter;
  String? hotAfter;
  String? risingAfter;

  Future<void> getAllNewPosts() async {
    emit(GetAllNewPostLoading(isInitialLoad: newPosts.isEmpty));

    try {
      final activePosts = await useCasesPosts.getNewPosts(PaginationParams(limit: 25, after: newAfter));
      newAfter = activePosts?.after;
      newPosts.addAll(activePosts?.posts ?? []);
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

  Future<void> getAllHotPosts() async {
    emit(GetAllHotPostLoading(isInitialLoad: hotPosts.isEmpty));
    try {
      final activePosts = await useCasesPosts.getHotPosts(PaginationParams(limit: 25, after: hotAfter));
      hotAfter = activePosts?.after;
      hotPosts.addAll(activePosts?.posts ?? []);
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

  Future<void> getAllRisingPosts() async {
    emit(GetAllRisingPostLoading(isInitialLoad: risingPosts.isEmpty));

    try {
      final activePosts = await useCasesPosts.getRisingPosts(PaginationParams(limit: 25, after: risingAfter));
      risingAfter = activePosts?.after;
      risingPosts.addAll(activePosts?.posts ?? []);
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
}
