import 'package:flutter/material.dart';
import 'package:qr_scanner_app/pages/qr_create_page.dart';
import 'package:qr_scanner_app/pages/qr_scanner_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR SCANNER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScannerGeneratorHandler(),
    );
  }
}

class ScannerGeneratorHandler extends StatefulWidget {
  const ScannerGeneratorHandler({
    Key? key,
  }) : super(key: key);

  @override
  State<ScannerGeneratorHandler> createState() =>
      _ScannerGeneratorHandlerState();
}

class _ScannerGeneratorHandlerState extends State<ScannerGeneratorHandler> {
  String recevedMessage = "";

  @override
  Widget build(BuildContext context) {
    return recevedMessage == ""
        ? QRcodeGen(
            openScanner: () {
              setState(() {});
            },
          )
        : QRscanner(
            recevedMessages: recevedMessage,
          );
  }
}
