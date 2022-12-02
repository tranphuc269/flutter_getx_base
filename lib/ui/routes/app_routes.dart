import '../views/main_navigation/main_nav_route.dart';
import '../views/main_navigation/main_nav_view.dart';
import '../views/qr_code_scanner/qr_code_scanner_route.dart';
import '../views/sample_feature/detail/sample_feature_detail_route.dart';
import '../views/sample_feature/list/sample_feature_list_route.dart';

class AppPages {
  static const initial = MainNavView.route;

  static final routes = [

    ...mainNavRoute,
    ...sampleFeatureRoute,
    ...sampleFeatureDetailPage,
    ...qrCodeRoute,
  ];
}
