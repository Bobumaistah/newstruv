part of 'qr_code_scan_bloc.dart';

sealed class QrCodeScanState extends Equatable {
  const QrCodeScanState();

  @override
  List<Object> get props => [];
}

final class QrCodeScanInitial extends QrCodeScanState {}

final class QrCodeScanLoading extends QrCodeScanState {}

final class QrCodeScanSuccess extends QrCodeScanState {
  final Barcode data;

  const QrCodeScanSuccess(this.data);
}

final class QrCodeScanError extends QrCodeScanState {
  final String message;

  const QrCodeScanError(this.message);
}
