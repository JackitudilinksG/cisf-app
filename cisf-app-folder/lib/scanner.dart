//scanner page

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerWidget extends StatefulWidget {
  const QRScannerWidget({super.key});
  @override
  State<StatefulWidget> createState() => _QRScannerWidgetState();
}

bool _screenOpened = false;
class _QRScannerWidgetState extends State<QRScannerWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCAN ME'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/reg_trees.dart");
            }, icon: const Icon(
              Icons.backpack,
              ),
          )
        ],
      ),
      body: MobileScanner(
        controller: MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates),
        onDetect: (capture) {
          print(capture);
        },
      ),
    );
  }

  void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
    if(!_screenOpened) {
      final String code = barcode.rawValue ?? "---";
      debugPrint("Barcode found! $code");
      _screenOpened = true;
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
        FoundCodeScreen(screenClosed: _screenWasClosed, value: code),
      ));
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}

class MobileScannerArguments {
}