import 'package:flutter/material.dart';

class QRscanner extends StatefulWidget {
  final String recevedMessages;
  const QRscanner({
    Key? key,
    this.recevedMessages = "",
  }) : super(key: key);

  @override
  State<QRscanner> createState() => _QRscannerState();
}

class _QRscannerState extends State<QRscanner> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(padding: EdgeInsets.all(15)),
    );
  }
}
