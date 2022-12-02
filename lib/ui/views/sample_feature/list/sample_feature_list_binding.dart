import 'package:get/get.dart';
import '../../../../data/repositories/sample_feature/sample_feature_repository_impl.dart';
import '../../../../data/sources/local/sample_feature/sample_feature_dao_impl.dart';
import '../../../../data/sources/server/sample_feature/sample_feature_api_impl.dart';
import 'sample_feature_list_controller.dart';


class SampleFeatureListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => SampleFeatureListController(
        repository: SampleFeatureRepositoryImpl(
          apiService: SampleFeatureApiImpl(),
          dao: SampleFeatureDaoImpl(),
        ),
      ),
    );
  }
}