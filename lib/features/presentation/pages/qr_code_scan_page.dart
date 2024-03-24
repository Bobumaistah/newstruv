import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:struv_iot_app/features/presentation/bloc/qr_code_scan_bloc.dart';
import 'package:struv_iot_app/routes/routes.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Tambahkan Alat",
          style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.titleLarge,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 80),
            SvgPicture.asset("assets/images/illustration.svg"),
            const SizedBox(height: 30),
            BlocBuilder<QrCodeScanBloc, QrCodeScanState>(
              builder: (context, state) {
                if (state is QrCodeScanSuccess) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xff274C77),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.qr_code_rounded,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(31, 123, 120, 120),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              state.data.code.toString(),
                              style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.titleMedium,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: 5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    Text(
                      "Tambahkan alat Struvite",
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.titleLarge,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Pindai QR Code yang berada pada alat struvite anda untuk menambah alat",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            BlocBuilder<QrCodeScanBloc, QrCodeScanState>(
              builder: (context, state) {
                if (state is QrCodeScanSuccess) {
                  return button(
                      context: context, route: "/home", text: "Lanjut");
                }
                return button(
                    context: context, route: "/qrscan", text: "Pindai QR Code");
              },
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  ElevatedButton button({
    required BuildContext context,
    required String route,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: () => router.push(route),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff274C77),
        elevation: 0,
        minimumSize: const Size(double.infinity, 51),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.titleMedium,
          color: Colors.white,
        ),
      ),
    );
  }
}
