import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/themes/app_style.dart';
import '../../../../../data/models/hives/sample_feature/sample_feature.dart';
import '../../../../widgets/cached_image.dart';
import '../sample_feature_detail_controller.dart';

class FollowingTabView extends GetView<SampleFeatureDetailController> {
  const FollowingTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, _) => const Divider(),
      itemCount: controller.user.value?.followingList?.length ?? 0,
      itemBuilder: (_, index) {
        final SampleFeature? user =
            controller.user.value!.followingList![index];
        return (user == null)
            ? const Center(
                child: Text('User belum mem-follow siapapun'),
              )
            : ListTile(
                // onTap: () => controller.onChooseUser(user: user),
                leading: CircleAvatar(
                  radius: 30,
                  child: CachedImage(url: '${user.avatarUrl}&s=200'),
                ),
                title: Text(
                  user.username.toString(),
                ),
                subtitle: Text(
                  user.gitUrl.toString(),
                  style: AppStyle.normalSmall,
                ),
              );
      },
    );
  }
}
