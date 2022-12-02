import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/themes/app_style.dart';
import '../../../../data/models/hives/sample_feature/sample_feature.dart';
import '../../../widgets/base/base_pagination_view.dart';
import '../../../widgets/cached_image.dart';
import 'sample_feature_list_controller.dart';


class SampleFeatureListView extends GetView<SampleFeatureListController> {
  const SampleFeatureListView({Key? key}) : super(key: key);
  static const String route = '/user-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SkyAppBar.secondary(title: International.userList.tr),
      body: BasePaginationView<SampleFeature>(
        pagingController: controller.pagingController,
        onRefresh: () => controller.refreshPage(),
        itemBuilder: (BuildContext context, item, int index) {
          return ListTile(
            onTap: () => controller.onChooseUser(user: item),
            leading: CircleAvatar(
              radius: 30,
              child: CachedImage(url: '${item.avatarUrl}&s=200'),
            ),
            title: Text(item.username.toString()),
            subtitle: Text(
              item.gitUrl.toString(),
              style: AppStyle.normalSmall,
            ),
          );
        },
      ),
    );
  }
}