import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_app/pages/qr_scanner_res.dart';

class QRViewBuild extends StatefulWidget {
  const QRViewBuild({Key? key}) : super(key: key);

  @override
  State<QRViewBuild> createState() => _QRViewBuildState();
}

class _QRViewBuildState extends State<QRViewBuild> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    await controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          buildQrView(context),
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderLength: 25,
          borderRadius: 15,
          borderColor: Colors.blue,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen(
      (qrcode) => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => QRScannerRes(
                  qrcodeResult: qrcode.code.toString(),
                )),
          ),
        )
      },
    );
  }
}
