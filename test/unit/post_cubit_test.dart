import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lepaya/core/utils/enums.dart';
import 'package:lepaya/modules/post/presentation/state_managment/post_cubit.dart';
import 'package:lepaya/modules/post/data/models/m_post.dart';
import 'package:mockito/mockito.dart';

import 'mock_use_cases.mocks.dart';

void main() {
  group('PostCubit', () {
    late PostCubit postCubit;
    late MockUseCasesPosts mockUseCasesPosts;
    late MockUseCaseGetHotPosts mockGetHotPosts;
    late MockUseCaseGetNewPosts mockGetNewPosts;
    late MockUseCaseGetRisingPosts mockGetRisingPosts;

    setUp(() {
      mockUseCasesPosts = MockUseCasesPosts();
      mockGetHotPosts = MockUseCaseGetHotPosts();
      mockGetNewPosts = MockUseCaseGetNewPosts();
      mockGetRisingPosts = MockUseCaseGetRisingPosts();

      when(mockUseCasesPosts.getHotPosts).thenReturn(mockGetHotPosts);
      when(mockUseCasesPosts.getNewPosts).thenReturn(mockGetNewPosts);
      when(mockUseCasesPosts.getRisingPosts).thenReturn(mockGetRisingPosts);

      when(mockGetHotPosts.call(any)).thenAnswer((_) async => const MPost(posts: []));
      when(mockGetNewPosts.call(any)).thenAnswer((_) async => const MPost(posts: []));
      when(mockGetRisingPosts.call(any)).thenAnswer((_) async => const MPost(posts: []));
    });

    tearDown(() {
      postCubit.close();
    });

    test('initial state is PostInitial', () {
      postCubit = PostCubit(
        useCasesPosts: mockUseCasesPosts,
        loadHotPostsInitially: false,
      );
      expect(postCubit.state, equals(PostInitial()));
    });

    blocTest<PostCubit, PostState>(
      'emits [GetAllHotPostLoading, GetAllHotPostSuccess] when getAllHotPosts is successful',
      build: () {
        when(mockGetHotPosts.call(any)).thenAnswer((_) async => const MPost(posts: [MPostData(id: '1', title: 'Post 1')]));
        postCubit = PostCubit(
          useCasesPosts: mockUseCasesPosts,
          loadHotPostsInitially: false,
        );
        return postCubit;
      },
      act: (cubit) => cubit.getAllHotPosts(),
      expect: () => [
        isA<GetAllHotPostLoading>().having((state) => state.isInitialLoad, 'isInitialLoad', true),
        isA<GetAllHotPostSuccess>().having((state) => state.posts, 'posts', [const MPostData(id: '1', title: 'Post 1')]),
      ],
      verify: (_) {
        verify(mockGetHotPosts.call(any)).called(1);
      },
    );

    blocTest<PostCubit, PostState>(
      'emits [GetAllNewPostLoading, GetAllNewPostError] when getAllNewPosts fails',
      build: () {
        when(mockGetNewPosts.call(any)).thenThrow(Exception('Error'));
        postCubit = PostCubit(
          useCasesPosts: mockUseCasesPosts,
          loadHotPostsInitially: false,
        );
        return postCubit;
      },
      act: (cubit) => cubit.getAllNewPosts(),
      expect: () => [
        isA<GetAllNewPostLoading>().having((state) => state.isInitialLoad, 'isInitialLoad', true),
        isA<GetAllNewPostError>(),
      ],
      verify: (_) {
        verify(mockGetNewPosts.call(any)).called(1);
      },
    );

    blocTest<PostCubit, PostState>(
      'emits [GetAllRisingPostLoading, GetAllRisingPostSuccess] when getAllRisingPosts is successful',
      build: () {
        when(mockGetRisingPosts.call(any)).thenAnswer((_) async => const MPost(posts: [MPostData(id: '1', title: 'Post 1')]));
        postCubit = PostCubit(
          useCasesPosts: mockUseCasesPosts,
          loadHotPostsInitially: false,
        );
        return postCubit;
      },
      act: (cubit) => cubit.getAllRisingPosts(),
      expect: () => [
        isA<GetAllRisingPostLoading>().having((state) => state.isInitialLoad, 'isInitialLoad', true),
        isA<GetAllRisingPostSuccess>().having((state) => state.posts, 'posts', [const MPostData(id: '1', title: 'Post 1')]),
      ],
      verify: (_) {
        verify(mockGetRisingPosts.call(any)).called(1);
      },
    );

    blocTest<PostCubit, PostState>(
      'emits [TabChanged, GetAllNewPostLoading, GetAllNewPostSuccess] when selectTab is called',
      build: () {
        when(mockGetNewPosts.call(any)).thenAnswer((_) async => const MPost(posts: []));
        postCubit = PostCubit(
          useCasesPosts: mockUseCasesPosts,
          loadHotPostsInitially: false,
        );
        return postCubit;
      },
      act: (cubit) => cubit.selectTab(TabType.New),
      expect: () => [
        isA<TabChanged>().having((state) => state.tab, 'tab', TabType.New),
        isA<GetAllNewPostLoading>().having((state) => state.isInitialLoad, 'isInitialLoad', true),
        isA<GetAllNewPostSuccess>().having((state) => state.posts, 'posts', const []),
      ],
      verify: (_) {
        verify(mockGetNewPosts.call(any)).called(1);
      },
    );
  });
}
