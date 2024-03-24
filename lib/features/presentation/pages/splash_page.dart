import 'package:flutter/material.dart';
import 'package:struv_iot_app/routes/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => router.pushNamed('qrcode-page'),
              child: const Text("scan"),
            ),
          ),
        ],
      ),
    );
  }
}
