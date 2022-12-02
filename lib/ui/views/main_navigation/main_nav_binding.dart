import 'package:get/get.dart';
import '../../../data/sources/server/catalog/banner/banner_api_impl.dart';
import '../../../data/sources/server/catalog/category/category_service_impl.dart';
import '../../../data/sources/server/catalog/producer/producer_service_impl.dart';
import '../../../data/sources/server/product/product_service_impl.dart';
import 'main_nav_controller.dart';

class MainNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainNavController());
    // Get.lazyPut(() => LoginController(dataSource: AuthApiImpl()));
  }
}
