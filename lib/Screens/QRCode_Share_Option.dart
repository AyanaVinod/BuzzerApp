// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:share/share.dart';
// import 'dart:typed_data';
//
// class QRCodeScreen extends StatelessWidget {
//   final String userId;
//   final String currentTime;
//
//   QRCodeScreen({required this.userId, required this.currentTime});
//
//   Future<void> _shareQRCode() async {
//     // Generate QR code image as a Uint8List
//     final qrImageData = await QrPainter(
//       data: "$userId $currentTime",
//       version: QrVersions.auto,
//     ).toImageData(180);
//
//     // Convert Uint8List to data URI
//     final qrDataUri = 'data:asset.images/ic_qrcode.png;base64,${base64Encode(qrImageData?.buffer?.asUint8List() ?? [])}';
//
//     // Share QR code data URI using the share package
//     await Share.share(
//       '$userId $currentTime: $qrDataUri',
//       subject: "QR Code",
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code'),
//       ),
//       body: Center(
//         child: QrImage(
//           data: "$userId $currentTime",
//           version: QrVersions.auto,
//           foregroundColor: Colors.black,
//           size: 180,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _shareQRCode,
//         tooltip: 'Share',
//         child: Icon(Icons.share),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class QRCodeScreen extends StatelessWidget {
  final String userId;
  final String currentTime;

  QRCodeScreen({required this.userId, required this.currentTime});

  Future<void> _shareQRCode() async {
    final qrData = "$userId $currentTime";
    final qrLink = "https://example.com/qr?data=$qrData";

    await Share.share(
      'Check out my QR code: $qrLink',
      subject: 'QR Code',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: QrImage(
          data: "$userId $currentTime",
          version: QrVersions.auto,
          foregroundColor: Colors.black,
          size: 180,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shareQRCode,
        tooltip: 'Share',
        child: Icon(Icons.share),
      ),
    );
  }
}