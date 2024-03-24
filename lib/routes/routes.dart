import 'package:go_router/go_router.dart';
import 'package:struv_iot_app/features/presentation/pages/home_page.dart';
import 'package:struv_iot_app/features/presentation/pages/qr_code_scan_page.dart';
import 'package:struv_iot_app/features/presentation/pages/qr_code_scan.dart';
import 'package:struv_iot_app/features/presentation/pages/splash_page.dart';

import 'goroute_widget.dart';

final router = GoRouter(
  routes: [
    goRoute(
      name: 'splash-page',
      path: '/s',
      child: const SplashPage(),
    ),
    goRoute(
      name: 'qrcode-page',
      path: '/',
      child: const QrCodePage(),
    ),
    goRoute(
      name: 'qrscan-page',
      path: '/qrscan',
      child: const QrCodeScan(),
    ),
    goRoute(
      name: 'home-page',
      path: '/home',
      child: const HomePage(),
    ),
  ],
  initialLocation: '/',
  debugLogDiagnostics: true,
  routerNeglect: true,
);
