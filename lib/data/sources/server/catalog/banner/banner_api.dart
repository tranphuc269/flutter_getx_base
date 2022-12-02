import '../../../../models/response/catalog/banner/banner_data.dart';

abstract class BannerService{
  Future<List<BannerData>> getAllBanner();
}