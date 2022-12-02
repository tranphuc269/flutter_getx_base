import 'sample_feature_list_binding.dart';
import 'sample_feature_list_view.dart';
import 'package:get/get.dart';


final sampleFeatureRoute = [
  GetPage(
    name: SampleFeatureListView.route,
    page: () => const SampleFeatureListView(),
    binding: SampleFeatureListBinding(),
    participatesInRootNavigator: true,
  ),
];