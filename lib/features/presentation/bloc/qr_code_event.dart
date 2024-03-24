part of 'qr_code_scan_bloc.dart';

sealed class QrCodeScanEvent extends Equatable {
  const QrCodeScanEvent();

  @override
  List<Object> get props => [];
}

final class QrCodeSaveState extends QrCodeScanEvent {
  final Barcode payload;

  const QrCodeSaveState({required this.payload});

  @override
  List<Object> get props => [payload];
}
