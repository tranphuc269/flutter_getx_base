import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConst {
  /*
    ...App General Const
  */
  static const double defaultMediumMargin = 16;

  static const double defaultMediumMargin12 = 12;

  static const double defaultLargeMargin = 32;

  static const double defaultSmallMargin = 8;

  static const double defaultVerySmallMargin = 4;

  /* Size Helper
  ... Size of everything
   */

  /// The height of SafeArea Widget
  static double safeAreaHeight = Get.height -
      MediaQuery.of(Get.context!).padding.top -
      MediaQuery.of(Get.context!).padding.bottom;

  /// The height of SafeArea - Toolbar or the height of content view
  static double contentHeight = safeAreaHeight - kToolbarHeight;

  static EdgeInsetsGeometry kPaddingVeryLargeDefaultHorizontal =
      const EdgeInsets.symmetric(horizontal: 80);

  static EdgeInsetsGeometry kPaddingLargeDefaultHorizontal =
      const EdgeInsets.symmetric(horizontal: 32);
  static EdgeInsetsGeometry kPaddingLargeDefaultVertical =
      const EdgeInsets.symmetric(vertical: 32);
  static EdgeInsetsGeometry kPaddingMediumDefaultHorizontal =
      const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsetsGeometry kPaddingMediumDefaultVertical =
      const EdgeInsets.symmetric(vertical: 16);
  static EdgeInsetsGeometry kPaddingMediumDefault = const EdgeInsets.all(16);

  static EdgeInsetsGeometry kPaddingSmallDefaultHorizontal =
      const EdgeInsets.symmetric(horizontal: 8);
  static EdgeInsetsGeometry kPaddingSmallDefaultVertical =
      const EdgeInsets.symmetric(vertical: 8);
  static EdgeInsetsGeometry kPaddingSmallDefault = const EdgeInsets.all(8);
}
