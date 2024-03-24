import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:struv_iot_app/features/presentation/bloc/qr_code_scan_bloc.dart';
import 'package:struv_iot_app/routes/routes.dart';

class QrCodeScan extends StatefulWidget {
  const QrCodeScan({super.key});

  @override
  State<QrCodeScan> createState() => _QrCodeScanState();
}

class _QrCodeScanState extends State<QrCodeScan> {
  Barcode? result;

  QRViewController? controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            router.go('/');
          },
        ),
        actions: [
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(50, 50),
            ),
            onPressed: () async {
              await controller?.toggleFlash();
              setState(() {});
            },
            icon: FutureBuilder(
              future: controller?.getFlashStatus(),
              builder: (context, snapshot) {
                return Icon(
                  size: 30,
                  color: snapshot.data != false ? Colors.amber : Colors.black,
                  Icons.flash_on_rounded,
                );
              },
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(flex: 4, child: _buildQrView(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 300 ||
            MediaQuery.of(context).size.height < 300)
        ? 150.0
        : 300.0;
    return BlocListener<QrCodeScanBloc, QrCodeScanState>(
      listener: (context, state) {
        if (state is QrCodeScanSuccess) {
          router.go("/");
        }
      },
      child: QRView(
        key: qrKey,
        onQRViewCreated: (QRViewController controller) {
          setState(() {
            this.controller = controller;
          });
          controller.scannedDataStream.listen((scanData) {
            setState(() {
              result = scanData;
              context
                  .read<QrCodeScanBloc>()
                  .add(QrCodeSaveState(payload: scanData));
            });
          });
        },
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea,
        ),
        onPermissionSet: (ctrl, p) {
          if (!p) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('no Permission')),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
