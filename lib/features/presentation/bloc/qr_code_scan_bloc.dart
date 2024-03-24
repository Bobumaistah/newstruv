import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeScanBloc extends Bloc<QrCodeScanEvent, QrCodeScanState> {
  QRViewController? controller;

  QrCodeScanBloc() : super(QrCodeScanInitial()) {
    on<QrCodeSaveState>((event, emit) {
      emit(QrCodeScanSuccess(event.payload));
    });
  }
}
