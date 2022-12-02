import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/helper/dialog_helper.dart';
import '../../../../data/models/hives/sample_feature/sample_feature.dart';
import '../../../../data/repositories/sample_feature/sample_feature_repository.dart';

class SampleFeatureDetailController extends BaseController {
  SampleFeatureDetailController({required this.repository});

  final SampleFeatureRepository repository;

  final GlobalKey headerKey = GlobalKey();
  final GlobalKey detailInfoKey = GlobalKey();
  final headerWidget = Rxn<Size>();
  final detailInfoWidget = Rxn<Size>();

  final user = Rxn<SampleFeature>();

  @override
  void onInit() {
    super.onInit();
    user.value = Get.arguments;
  }

  @override
  void onReady() async {
    headerWidget.value =
        (headerKey.currentContext?.findRenderObject() as RenderBox).size;
    detailInfoWidget.value =
        (detailInfoKey.currentContext?.findRenderObject() as RenderBox).size;
    await getDetailUser();
  }

  getDetailUser() async {
    showLoading();
    try {
      await repository.getDetailUser(user: user.value!).then((res) {
        hideLoading();
        user.value = res;
      });
    } catch (e) {
      hideLoading();
      AppDialog.show(
        typeDialog: TypeDialog.RETRY,
        dismissible: false,
        message: e.toString(),
        onCancel: () {
          AppDialog.close();
          Get.back();
        },
        onPress: () {
          AppDialog.close();
          getDetailUser();
        },
      );
    }
  }
}
