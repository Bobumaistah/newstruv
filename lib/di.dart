import 'package:get_it/get_it.dart';
import 'package:struv_iot_app/features/presentation/bloc/qr_code_scan_bloc.dart';

GetIt locator = GetIt.I;

Future<void> init() async {
  locator.registerFactory(() => QrCodeScanBloc());
}
