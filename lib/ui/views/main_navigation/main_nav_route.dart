import 'package:get/get.dart';

import 'main_nav_binding.dart';
import 'main_nav_view.dart';


final mainNavRoute = [
  GetPage(
    name: MainNavView.route,
    page: () => const MainNavView(),
    binding: MainNavBinding(),
    participatesInRootNavigator: true,
  ),
];