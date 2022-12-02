import '../../../models/hives/repo/repo.dart';
import '../../../models/hives/sample_feature/sample_feature.dart';


abstract class SampleFeatureApi {
  Future<List<SampleFeature>> getUsers({required int page, required int perPage});
  Future<SampleFeature> getDetailUser({required String username});
  Future<List<SampleFeature>> getFollowers({required String username});
  Future<List<SampleFeature>> getFollowings({required String username});
  Future<List<Repo>> getRepos({required String username});
}