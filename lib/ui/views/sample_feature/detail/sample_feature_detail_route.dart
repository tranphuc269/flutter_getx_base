import 'sample_feature_detail_binding.dart';
import 'package:get/get.dart';
import 'sample_feature_detail_view.dart';

final sampleFeatureDetailPage = [
  GetPage(
    name: SampleFeatureDetailView.route,
    page: () => const SampleFeatureDetailView(),
    binding: SampleFeatureDetailBinding(),
  ),
];
