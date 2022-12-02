import 'core/app/app_env.dart';
import 'core/app/app_info.dart';
import 'data/sources/server/catalog/banner/banner_api_impl.dart';
import 'initializer.dart';
import 'ui/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'core/localization/app_translations.dart';
import 'core/localization/locale_helper.dart';
import 'core/themes/app_theme.dart';
import 'core/themes/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();
  AppInfo.setInfo(await PackageInfo.fromPlatform());
  AppEnv.set(Env.DEVELOPMENT);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<ThemeManager>(
      builder: (ctr) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Skybase Flutter Getx',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: (ctr.isDark.isTrue) ? ThemeMode.dark : ThemeMode.light,
        translations: AppTranslation(),
        locale: LocaleHelper().getCurrentLocale(),
        fallbackLocale: LocaleHelper().fallbackLocale,
        getPages: AppPages.routes,
        initialRoute: AppPages.initial,
      ),
    );
  }
}
