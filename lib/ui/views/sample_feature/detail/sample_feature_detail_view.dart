import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app/app_constant.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_style.dart';
import '../../../../data/models/hives/sample_feature/sample_feature.dart';
import '../../../widgets/base/base_view.dart';
import '../../../widgets/cached_image.dart';
import '../../../widgets/colored_status_bar.dart';
import 'component/follower_tab_view.dart';
import 'component/following_tab_view.dart';
import 'component/repo_tab_view.dart';
import 'sample_feature_detail_controller.dart';

class SampleFeatureDetailView extends GetView<SampleFeatureDetailController> {

  const SampleFeatureDetailView({Key? key}) : super(key: key);
  static const String route = '/user-detail';

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      child: Scaffold(
        // appBar: SkyAppBar.primary(title: controller.user.value?.username),
        body: SafeArea(
          child: Obx(
            () => BaseView(
              loadingEnabled: controller.isLoading.isTrue,
              errorEnabled: controller.user.value == null,
              isConnectNetwork: controller.isConnectNetwork.value,
              onRetry: () => controller.getDetailUser(),
              child: Column(
                children: [
                  _buildHeader(controller.user.value),
                  _buildDetailInfo(controller.user.value),
                  _tabComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildHeader(SampleFeature? user) {
    return Padding(
      key: controller.headerKey,
      padding: const EdgeInsets.symmetric(horizontal: AppConst.defaultMediumMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 45,
            child: CachedImage(url: '${user?.avatarUrl}&s=200'),
          ),
          Column(
            children: [
              Text(
                '${user?.repository ?? 0}',
                style: AppStyle.headline3,
              ),
              const Text('Repository'),
            ],
          ),
          Column(
            children: [
              Text(
                '${user?.followers ?? 0}',
                style: AppStyle.headline3,
              ),
              const Text('Follower'),
            ],
          ),
          Column(
            children: [
              Text(
                '${user?.following ?? 0}',
                style: AppStyle.headline3,
              ),
              const Text('Following'),
            ],
          ),
        ],
      ),
    );
  }

  _buildDetailInfo(SampleFeature? user) {
    return Padding(
      key: controller.detailInfoKey,
      padding: const EdgeInsets.symmetric(horizontal: AppConst.defaultMediumMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(user?.name ?? '--', style: AppStyle.headline4),
          Text(user?.bio ?? '--'),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_city),
              Text(' ${user?.company ?? '--'}'),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.location_on),
              Text(' ${user?.location ?? '--'}'),
            ],
          ),
        ],
      ),
    );
  }

  _tabComponent() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.accent,
            tabs: [
              Tab(text: 'Repositories'),
              Tab(text: 'Followers'),
              Tab(text: 'Followings'),
            ],
          ),
          Obx(() => SizedBox(
                height: AppConst.contentHeight -
                    (controller.headerWidget.value?.height ?? 0) -
                    (controller.detailInfoWidget.value?.height ?? 0) -
                    kTextTabBarHeight,
                child: const TabBarView(
                  children: [
                    RepoTabView(),
                    FollowerTabView(),
                    FollowingTabView(),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
