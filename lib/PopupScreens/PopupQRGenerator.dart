import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
//import 'package:share/share.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:share_plus/share_plus.dart';

import '../Colors/colors.dart';
import '../Screens/CurrentSession.dart';
import '../Screens/QRGenerated.dart';
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as img;
import 'dart:io';
//import 'package:flutter_share/flutter_share.dart';
//import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart';

//import 'package:share_plus/share_plus.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import '../Screens/ShareOption.dart';

class PopupQR extends StatefulWidget {
  const PopupQR({super.key});
  @override
  _PopupQRState createState() => _PopupQRState();
}

class _PopupQRState extends State<PopupQR> with SingleTickerProviderStateMixin {
  String userId = currentuser;
  int? currentTime = currentNtpTimeMs;

  final GlobalKey globalKey=GlobalKey();
  bool  _scannedData = true;
  QRViewController? _controller;

  // void _onQRViewCreated(QRViewController controller) {
  //   setState(() {
  //     _controller = controller;
  //   });
  //   _controller?.scannedDataStream.listen((scanData) {
  //     if (_isScanning) {
  //       setState(() {
  //         _isScanning = false;
  //       });
  //       // Extract user ID and current time from scanned data
  //       String? scannedData = scanData.code;
  //       List<String>? data = scannedData?.split(' ');
  //       String userId = data![0];
  //       String currentTime = data[1];
  //       // Display user ID and current time in your UI
  //       print("User ID: $userId");
  //       print("Current Time: $currentTime");
  //     }
  //   });
  // }


  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _scannedData = scanData as bool;
      });

      String? scannedData = scanData.code;
          List<String>? data = scannedData?.split(' ');
          String userId = data![0];
          String currentTime = data![1];

      // Stop scanning after a QR code is scanned
      controller.stopCamera();
    });
  }
  Future<void> ConvertQRCodeToImage() async {
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String imagePath = '$tempPath/ic_qrcode.png';
    File imageFile = File(imagePath);
    await imageFile.writeAsBytes(pngBytes);

    // Share the generated QR code image
    await Share.shareXFiles(
            [XFile( imagePath)],
            text: "test",);
  }

  // Future<void> ConvertQRCodeToImage() async{
  //   RenderRepaintBoundary boundary=globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image=await boundary.toImage();
  //   final directory=(await getApplicationDocumentsDirectory()).path;
  //   ByteData? byteData=await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List pngBytes=byteData!.buffer.asUint8List();
  //   Directory tempDir = await getTemporaryDirectory();
  //   String tempPath = tempDir.path;
  //   String imagePath = '$tempPath/ic_qrcode.png';
  //   File imageFile = File(imagePath);
  //   File imgFile=File("$directory/ic_qrcode.png");
  //   await imgFile.writeAsBytes(pngBytes);
  //   await Share.shareXFiles(
  //     [XFile( imagePath)],
  //     text: "test",);
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: gamePopColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                transform: Matrix4.translationValues(260, -5, 0),
                child: Row(
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                          border: Border.all(color: borderHomeColor,
                              width: 1.0),
                          color: popupBackground1,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRGenerated()));
                            });
                          },
                          //This keeps the splash effect within the circle
                          borderRadius: BorderRadius.circular(
                              1000.0), //Something large to ensure a circle
                          child: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              CupertinoIcons.multiply,
                              size: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      // RepaintBoundary(key:globalKey,
      //
      //         child:QrImage(
      //
      //           data: "$userId $currentTime",
      //           version: QrVersions.auto,
      //           foregroundColor: textYellow,
      //           size: 100,
      //         ),
      //         ),
              RepaintBoundary(
                key: globalKey,
                child: GestureDetector(
                  onTap: () {
                    // Start scanning the QR code
                    _controller?.resumeCamera();
                  },
                  child: QrImage(
                    data: "$userId $currentTime",
                    version: QrVersions.auto,
                    foregroundColor: textYellow,
                    size: 180,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              const Text(
                'share this QR with others to join',
                style: TextStyle(
                    color: textYellow,
                    fontFamily: 'Gilroy',
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 3),
              ElevatedButton.icon(
                icon: const Text('Share'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  // Background color
                  onPrimary: Colors.black,
                  // Text color
                  elevation: 2,
                  textStyle: const TextStyle(
                      fontSize: 14, fontFamily: 'Gilroy'),
                  minimumSize: const Size(150, 30),
                  // Button elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30), // Button border radius
                  ),
                ),
                label: Icon(Icons.share, size: 15),
                onPressed:() {
                  ConvertQRCodeToImage();
                 // shareQRCode();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
  }






