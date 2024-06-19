import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lepaya/core/extension/color_extension.dart';
import 'package:lepaya/core/extension/context_extension.dart';
import 'package:lepaya/core/utils/enums.dart';
import 'package:lepaya/core/utils/helpers/app_alert.dart';
import 'package:lepaya/core/widgets/w_shared_scaffold.dart';
import 'package:lepaya/modules/post/data/models/m_post.dart';
import 'package:lepaya/modules/post/presentation/state_managment/post_cubit.dart';
import 'package:lepaya/modules/post/presentation/widgets/w_post_item.dart';
import 'package:lepaya/modules/post/presentation/widgets/w_post_item_animation.dart';
import 'package:lepaya/modules/post/presentation/widgets/w_post_type_tab.dart';

class SNPost extends StatelessWidget {
  const SNPost({super.key});

  @override
  Widget build(BuildContext context) {
    final PostCubit cubit = Modular.get<PostCubit>();

    return WSharedScaffold(
      title: "/r/FlutterDev",
      body: Column(
        children: [
          ///[Tabs]
          Container(
            width: 428.w,
            height: 46.h,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.naturalColor0,
              border: Border(
                top: BorderSide(
                  color: context.theme.colorScheme.naturalColor1,
                  width: 1.0.w,
                ),
              ),
            ),
            child: BlocBuilder<PostCubit, PostState>(
              bloc: cubit,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WPostTypeTab(
                      label: "Hot",
                      isSelected: cubit.selectedTab == TabType.Hot,
                      onTap: () {
                        cubit.selectTab(TabType.Hot);
                      },
                    ),
                    WPostTypeTab(
                      label: "New",
                      isSelected: cubit.selectedTab == TabType.New,
                      onTap: () {
                        cubit.selectTab(TabType.New);
                      },
                    ),
                    WPostTypeTab(
                      label: "Rising",
                      isSelected: cubit.selectedTab == TabType.Rising,
                      onTap: () {
                        cubit.selectTab(TabType.Rising);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<PostCubit, PostState>(
              bloc: cubit,
              listener: (context, state) {
                if (state is GetAllNewPostError || state is GetAllHotPostError || state is GetAllRisingPostError) {
                  AppAlert.error('Failed to load posts');
                }

                if (state is PostsFullyLoaded) {
                  AppAlert.success('No more posts to load');
                }
              },
              builder: (context, state) {
                Widget currentTabContent = const Center(child: Text('No Posts'));

                if ((state is GetAllNewPostLoading && state.isInitialLoad) ||
                    (state is GetAllHotPostLoading && state.isInitialLoad) ||
                    (state is GetAllRisingPostLoading && state.isInitialLoad)) {
                  currentTabContent = const Center(child: CircularProgressIndicator());
                }

                if (state is GetAllNewPostSuccess || cubit.selectedTab == TabType.New && cubit.newPosts.isNotEmpty) {
                  currentTabContent = buildPostList(cubit.newPosts, cubit.scrollController, state is GetAllNewPostLoading);
                }
                if (state is GetAllHotPostSuccess || cubit.selectedTab == TabType.Hot && cubit.hotPosts.isNotEmpty) {
                  currentTabContent = buildPostList(cubit.hotPosts, cubit.scrollController, state is GetAllHotPostLoading);
                }
                if (state is GetAllRisingPostSuccess ||
                    cubit.selectedTab == TabType.Rising && cubit.risingPosts.isNotEmpty) {
                  currentTabContent = buildPostList(cubit.risingPosts, cubit.scrollController, state is GetAllRisingPostLoading);
                }

                return PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  transitionBuilder: (child, animation, secondaryAnimation) =>
                      FadeThroughTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        child: child,
                      ),
                  child: currentTabContent,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildPostList(List<MPostData> posts, ScrollController scrollController, bool isLoading) {
  return ListView.builder(
    controller: scrollController,
    padding: const EdgeInsets.all(0),
    itemCount: posts.length + 1,
    itemBuilder: (context, index) {
      if (index == posts.length) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 2000),
          child: isLoading
              ? Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h,),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
              : const SizedBox.shrink(),
        );
      }

      final post = posts[index];
      return WPostItemAnimation(
        child: WPostItem(
          title: post.title,
          content: post.selfText,
          url: post.url,
        ),
      );
    },
  );
}
