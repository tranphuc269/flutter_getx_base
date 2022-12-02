import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/themes/app_style.dart';
import '../../../../../data/models/hives/sample_feature/sample_feature.dart';
import '../../../../widgets/cached_image.dart';
import '../sample_feature_detail_controller.dart';

class FollowerTabView extends GetView<SampleFeatureDetailController> {
  const FollowerTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, _) => const Divider(),
      itemCount: controller.user.value?.followersList?.length ?? 0,
      itemBuilder: (_, index) {
        final SampleFeature? user =
            controller.user.value!.followersList![index];
        return (user == null)
            ? const Center(
                child: Text('Tidak ada follower'),
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
