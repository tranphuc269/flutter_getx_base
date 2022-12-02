

import '../../models/hives/sample_feature/sample_feature.dart';

abstract class SampleFeatureRepository {
  Future<List<SampleFeature>> getUsers({required int page, required int perPage});
  Future<SampleFeature> getDetailUser({required SampleFeature user});
}