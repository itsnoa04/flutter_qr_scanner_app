import 'package:flutter/material.dart';

class QRScannerRes extends StatelessWidget {
  final String qrcodeResult;
  const QRScannerRes({
    Key? key,
    required this.qrcodeResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(qrcodeResult),
        ),
      ),
    );
  }
}
