//scanner page

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_test/reg_trees.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  Barcode? result;
  QRViewController? _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller!.pauseCamera();
    }
    _controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 20, 0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  color: const Color(0xFF0EBD8D),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: QRView(
                  key: _qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              )
            )
          ]
        )
      )
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }
  
  bool _shouldProcessScannedData = true;
  void _onQRViewCreated(QRViewController controller) async {
    _controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!_shouldProcessScannedData) return;
      
      
      var matchedPattern;
      RegExp digitRegExp = RegExp(r'\d{1,}');
      if (digitRegExp.hasMatch(scanData.code.toString()) == true) {
        RegExpMatch? match = digitRegExp.firstMatch(scanData.code.toString());
        matchedPattern = match![0];
        print(matchedPattern);
      }



      print('Scanned QR code: ${scanData.code}');
      _shouldProcessScannedData = false;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TreesScreen(
            qrResult: (matchedPattern),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}