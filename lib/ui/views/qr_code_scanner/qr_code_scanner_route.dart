import 'package:get/get.dart';

import 'qr_code_scanner_view.dart';

final qrCodeRoute = [
  GetPage(
    name: QRCodeScannerView.route,
    page: () => QRCodeScannerView(),
  ),
];
