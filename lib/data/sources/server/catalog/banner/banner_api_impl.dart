import '../../../../../core/network/api_request.dart';
import '../../../../models/response/catalog/banner/banner_data.dart';
import '../../../../models/response/catalog/banner/banner_response.dart';
import 'banner_api.dart';

class BannerServiceImpl extends BannerService{
  @override
  Future<List<BannerData>> getAllBanner() async{
    const url = '/catalog-service/banners';
    // TODO: implement getAllBanner
    final _res = await sendRequest(
      url: url,
      requestMethod: RequestMethod.GET,
      useToken: true,
    );
    final BannerResponse banner = BannerResponse.fromJson(_res.data);
    return banner.data;
  }
}