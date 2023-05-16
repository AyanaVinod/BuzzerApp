import 'package:buzzerapp/Colors/colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: commonBackground,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _appbar(context),
              const SizedBox(
                height: 60,
              ),
              _firstContainer(),
              const SizedBox(
                height: 20,
              ),
              const QRViewExample(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _appbar(BuildContext context) {
  return AppBar(
    backgroundColor: commonBackground,
    title: Row(
      children: <Widget>[
        SizedBox(
          child: Material(
            type: MaterialType.transparency,
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: backArrowLeft),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        const SizedBox(
          child: Text(
            'QR Scanner',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontFamily: 'Gilroy',fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}

Widget _firstContainer() {
  return Container(
    child: const Align(
      alignment: Alignment.center,
      child: Text(
        'Scan QR to join',
        style: TextStyle(
            fontSize: 18,
            fontFamily: 'Gilroy',
            color: textYellow,
            fontWeight: FontWeight.w500),
      ),
    ),
  );
}

// Widget _secondContainer(BuildContext context) {
//   return Container(
//       height: 300,
//       child: const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: QRViewExample(),
//       ));
// }

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(
       padding: const EdgeInsets.only(left:7.25,right: 8.0,bottom: 9.0,top: 9.0),
        child: _buildQrView(context),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 280.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          overlayColor: Color.alphaBlend(
              const Color(0xff2C0041), const Color(0xff2C0055)),
          borderColor: textYellow,
          borderLength: 50,
          borderWidth: 13,

          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
      this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(()  {

          result = scanData;
      });
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
