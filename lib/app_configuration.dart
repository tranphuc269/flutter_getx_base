

import 'core/app/app_info.dart';
import 'core/network/api_token_manager.dart';

class AppConfiguration {
  //-- Main Configuration
  static const clientToken = 'Some Client Token';
  static const tokenType = TokenType.ACCESS_TOKEN;

  //-- Production
  static const productionAPI = 'https://015f-2a09-bac0-23-00-815-b50.ap.ngrok.io';
  static const productionSocket = 'https://015f-2a09-bac0-23-00-815-b50.ap.ngrok.io';
  static const midtransProductionKey = 'Some Key';

  //-- Staging
  static const stagingAPI = 'https://015f-2a09-bac0-23-00-815-b50.ap.ngrok.io';
  static const stagingSocket = 'https://015f-2a09-bac0-23-00-815-b50.ap.ngrok.io';
  static const midtransStagingKey = 'Some Key';

  //-- Development
  static const developmentAPI = 'https://65a8-2a09-bac1-7a80-50-00-245-65.ap.ngrok.io';
  static const developmentSocket = 'https://65a8-2a09-bac1-7a80-50-00-245-65.ap.ngrok.io';
  static const midtransDevKey = 'Some Key';

  //-- App Info
  static String appName = 'Skybase';
  static String appTag = 'Flutter Getx';
  static String appVersion = AppInfo.find.get.version;
  static String buildNumber = AppInfo.find.get.buildNumber;
  static String packageName = AppInfo.find.get.packageName;
}