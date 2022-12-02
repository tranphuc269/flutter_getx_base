import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/app_colors.dart';
import '../../widgets/colored_status_bar.dart';
import '../../widgets/common_widget.dart';
import '../qr_code_scanner/qr_code_scanner_view.dart';
import '../sample_feature/list/sample_feature_list_view.dart';
import '../utils/utils_view.dart';
import 'main_nav_controller.dart';

class MainNavView extends GetView<MainNavController> {
  const MainNavView({Key? key}) : super(key: key);
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredStatusBar(
        child: SafeArea(
          child: DoubleBack(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) => controller.index.value = index,
              children: [
                QRCodeScannerView(),
                const SampleFeatureListView(),
                const UtilsView(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.index.value,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.primary,
          onTap: (index) {
            controller.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
