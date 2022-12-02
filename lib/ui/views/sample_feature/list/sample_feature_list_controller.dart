import 'dart:developer';

import 'package:get/get.dart';

import '../../../../core/base/pagination_controller.dart';
import '../../../../data/models/hives/sample_feature/sample_feature.dart';
import '../../../../data/repositories/sample_feature/sample_feature_repository.dart';
import '../detail/sample_feature_detail_view.dart';

class SampleFeatureListController extends PaginationController<SampleFeature> {
  final SampleFeatureRepository repository;
  SampleFeatureListController({required this.repository});

  @override
  void getListData() async {
    try {
      await repository.getUsers(page: page, perPage: perPage).then((data) {
        loadNextData(data);
      });
    } catch (e) {
      log('Error : $e');
      pagingController.error = e;
    }
  }

  onChooseUser({required SampleFeature user}) {
    Get.toNamed(SampleFeatureDetailView.route, arguments: user);
  }
}