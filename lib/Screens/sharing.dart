// import 'package:flutter/material.dart';
// import 'package:share/share.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:android_intent_plus/android_intent.dart';
//
// class ShareQRCodeScreen extends StatelessWidget {
//   String qrCodeData = "https://example.com";
//
//   String generateQRCode(String data) {
//     QrImage qrImage = QrImage(
//       data: data,
//       version: QrVersions.auto,
//       size: 200.0,
//     );
//     String qrCodeData = "https://example.com"; // Replace with your data
//     String qrCodeImage = generateQRCode(qrCodeData);
//     return qrImage.toString();
//
//   }
//   // Replace with your data
//
//   void _onShareButtonPressed() {
//     String qrCodeImage = generateQRCode(qrCodeData); // Generate QR code image
//     Share.share(qrCodeImage, subject: 'QR Code'); // Share QR code image
//
//     // Create an AndroidIntent to share the QR code image on Android
//     final AndroidIntent androidIntent = AndroidIntent(
//       action: 'action_send',
//       type: 'image/*',
//       //extra: {'android.intent.extra.STREAM': qrCodeImage},
//     );
//     androidIntent.launch();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Share QR Code'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             QrImage(
//               data: qrCodeData,
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _onShareButtonPressed,
//               child: Text('Share QR Code'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:share/share.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: QRCodeSharingScreen(),
//   ));
// }
//
// class QRCodeSharingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String userId = '12345'; // Replace with the actual user ID
//     String currentTime = DateTime.now().toString(); // Replace with the actual current time
//     String qrCodeData = '$userId|$currentTime';
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code Sharing'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             QrImage(
//               data: qrCodeData,
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 _shareQRCode(qrCodeData);
//               },
//               child: Text('Share QR Code'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _shareQRCode(String qrCodeData) async {
//     try {
//       // Generate QR code image bytes
//       QrPainter qrPainter = QrPainter(
//         data: qrCodeData,
//         version: QrVersions.auto,
//         gapless: false,
//         color: Color(0xff1a1a1a),
//         emptyColor: Color(0xffffffff),
//       );
//       ByteData? byteData = await qrPainter.toImageData(300.0);
//       Uint8List? imageBytes = byteData?.buffer.asUint8List();
//
//       // Save QR code image to temporary file
//       final tempDir = await getTemporaryDirectory();
//       final file = await new File('${tempDir.path}/ic_qrcode.png').create();
//       await file.writeAsBytes(imageBytes!);
//
//       // Share image using share package
//       await Share.shareFiles(['${file.path}'], text: 'Join with my QR Code!');
//     } catch (e) {
//       print('Error sharing QR code: $e');
//     }
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Overlay Example',
//       home: ImageOverlay(),
//     );
//   }
// }
//
// class ImageOverlay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Background image
//             Image.asset(
//               'assets/images/ic_scored_vector.png',
//               fit: BoxFit.cover,
//               width: 150,
//               height: 150,
//             ),
//
//             // Overlay image
//             Positioned(
//               top: 0,
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Image.asset(
//                 'assets/images/ic_scored_text.png',
//                 width: 100.0,
//                 height: 100.0,
//                 alignment: Alignment.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Overlay Example',
//       home: ImageOverlay(),
//     );
//   }
// }
//
// class ImageOverlay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Image.asset(
//               'assets/images/ic_scored_vector.png',
//               width: 800,
//               height: 250,
//             ),
//
//             Positioned(
//               top: 0,
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Image.asset(
//                 'assets/images/ic_scored_text.png',
//                 width: 100.0,
//                 height: 100.0,
//                 alignment: Alignment.center,
//               ),
//             ),
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Image.asset(
//                 'assets/images/ic_scored_text_upper.png',
//                 width: 100.0,
//                 height: 100.0,
//                 alignment: Alignment.center,
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Image.asset(
//                 'assets/images/ic_scored_text_below.png',
//                 width: 100.0,
//                 height: 100.0,
//                 alignment: Alignment.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageOverlay extends StatefulWidget {
//   @override
//   _ImageOverlayState createState() => _ImageOverlayState();
// }
//
// class _ImageOverlayState extends State<ImageOverlay> with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late Animation<double> _animation1;
//   late AnimationController _controller2;
//   late Animation<double> _animation2;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller1 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation1 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller1);
//
//     _controller2 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation2 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller2);
//
//     _controller1.forward().then((_) {
//       _controller1.reverse();
//       _controller2.forward();
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller1.dispose();
//     _controller2.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: _animation1,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation1.value,
//                   child: Image.asset(
//                     'assets/images/ic_scored_text_upper.png',
//                     width: 100.0,
//                     height: 100.0,
//                     alignment: Alignment.center,
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 16.0), // Adding spacing between the images
//             AnimatedBuilder(
//               animation: _animation2,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation2.value,
//                   child: Image.asset(
//                     'assets/images/ic_scored_text_below.png',
//                     width: 100.0,
//                     height: 100.0,
//                     alignment: Alignment.center,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() => runApp(MaterialApp(
//   title: 'Image Overlay Example',
//   home: ImageOverlay(),
//));

// import 'package:flutter/material.dart';
//
// class ImageOverlay extends StatefulWidget {
//   @override
//   _ImageOverlayState createState() => _ImageOverlayState();
// }
//
// class _ImageOverlayState extends State<ImageOverlay> with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late Animation<double> _animation1;
//   late AnimationController _controller2;
//   late Animation<double> _animation2;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller1 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation1 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller1);
//
//     _controller2 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation2 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller2);
//
//     _controller1.forward().then((_) {
//       _controller1.reverse();
//       _controller2.forward();
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller1.dispose();
//     _controller2.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: _animation1,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation1.value,
//                   child: SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.asset(
//                       'assets/images/ic_scored_text_upper.png',
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 16.0), // Adding spacing between the images
//             AnimatedBuilder(
//               animation: _animation2,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation2.value,
//                   child: SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.asset(
//                       'assets/images/ic_scored_text_below.png',
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() => runApp(MaterialApp(
//   title: 'Image Overlay Example',
//   home: ImageOverlay(),
// ));

// import 'package:flutter/material.dart';
//
// class ImageOverlay extends StatefulWidget {
//   @override
//   _ImageOverlayState createState() => _ImageOverlayState();
// }
//
// class _ImageOverlayState extends State<ImageOverlay> with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late Animation<double> _animation1;
//   late AnimationController _controller2;
//   late Animation<double> _animation2;
//   late AnimationController _controller3;
//   late Animation<double> _animation3;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller1 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation1 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller1);
//
//     _controller2 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation2 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller2);
//
//     _controller3 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation3 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller3);
//
//     _controller1.forward().then((_) {
//       _controller1.reverse();
//       _controller2.forward();
//     });
//
//     _controller3.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller1.dispose();
//     _controller2.dispose();
//     _controller3.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AnimatedBuilder(
//                     animation: _animation1,
//                     builder: (BuildContext context, Widget? child) {
//                       return Transform.scale(
//                         scale: _animation1.value,
//                         child: SizedBox(
//                           width: 100.0,
//                           height: 100.0,
//                           child: Image.asset(
//                             'assets/images/ic_scored_text_upper.png',
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   SizedBox(height: 12.0),
//                   // Adding spacing between the images
//                   AnimatedBuilder(
//                     animation: _animation2,
//                     builder: (BuildContext context, Widget? child) {
//                       return Transform.scale(
//                         scale: _animation2.value,
//                         child: SizedBox(
//                           width: 100.0,
//                           height: 100.0,
//                           child: Image.asset(
//                             'assets/images/ic_scored.png',
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   SizedBox(height: 12.0), // Adding spacing between the images
//                   AnimatedBuilder(
//                     animation: _animation3,
//                     builder: (BuildContext context, Widget? child) {
//                       return Transform.scale(
//                         scale: _animation3.value,
//                         child: SizedBox(
//                           width: 100.0,
//                           height: 100.0,
//                           child: Image.asset(
//                             'assets/images/ic_scored_text_below.png', // Replace with your actual third image path
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//             ),
//         ),
//     );
//   }
//   void main() =>
//       runApp(MaterialApp(
//         title: 'Image Overlay Example',
//         home: ImageOverlay(),
//       ));
//
// }
// import 'package:flutter/material.dart';
//
// class ImageOverlay extends StatefulWidget {
//   @override
//   _ImageOverlayState createState() => _ImageOverlayState();
// }
//
// class _ImageOverlayState extends State<ImageOverlay> with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late Animation<double> _animation1;
//   late AnimationController _controller2;
//   late Animation<double> _animation2;
//   late AnimationController _controller3;
//   late Animation<double> _animation3;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller1 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation1 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller1);
//
//     _controller2 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation2 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller2);
//
//     _controller3 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation3 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller3);
//
//     _controller1.forward().then((_) {
//       _controller1.reverse();
//       _controller2.forward();
//     });
//
//     _controller3.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller1.dispose();
//     _controller2.dispose();
//     _controller3.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: _animation1,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation1.value,
//                   child: SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.asset(
//                       'assets/images/ic_scored_text_upper.png',
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 12.0),
//             AnimatedBuilder(
//               animation: _animation2,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation2.value,
//                   child: SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.asset(
//                       'assets/images/ic_scored.png',
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 12.0),
//             AnimatedBuilder(
//               animation: _animation3,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation3.value,
//                   child: SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.asset(
//                       'assets/images/ic_scored_text_below.png',
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() =>
//     runApp(MaterialApp(
//       title: 'Image Overlay Example',
//       home: ImageOverlay(),
//     ));

//
// import 'package:flutter/material.dart';
//
// class ImageOverlay extends StatefulWidget {
//   @override
//   _ImageOverlayState createState() => _ImageOverlayState();
// }
//
// class _ImageOverlayState extends State<ImageOverlay> with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late Animation<double> _animation1;
//   late AnimationController _controller2;
//   late Animation<double> _animation2;
//   late AnimationController _controller3;
//   late Animation<double> _animation3;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller1 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation1 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller1);
//
//     _controller2 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation2 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller2);
//
//     _controller3 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation3 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller3);
//
//     _controller2.forward().then((_) {
//       _controller1.forward();
//       _controller3.forward();
//     });
//
//     _controller1.addListener(() {
//       if (_controller1.isCompleted) {
//         _controller1.reverse();
//       }
//     });
//
//     _controller3.addListener(() {
//       if (_controller3.isCompleted) {
//         _controller3.reverse();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller1.dispose();
//     _controller2.dispose();
//     _controller3.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: _animation1,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation1.value,
//                   child: SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.asset(
//                       'assets/images/ic_scored_text_upper.png',
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 12.0),
//             AnimatedBuilder(
//               animation: _animation2,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation2.value,
//                   child: SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.asset(
//                       'assets/images/ic_scored.png',
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 12.0),
//             AnimatedBuilder(
//               animation: _animation3,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation3.value,
//                   child: SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.asset(
//                       'assets/images/ic_scored_text_below.png',
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageOverlay extends StatefulWidget {
//   @override
//   _ImageOverlayState createState() => _ImageOverlayState();
// }
//
// class _ImageOverlayState extends State<ImageOverlay>
//     with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late Animation<double> _animation1;
//   late AnimationController _controller2;
//   late Animation<double> _animation2;
//   late AnimationController _controller3;
//   late Animation<double> _animation3;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller1 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation1 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller1);
//
//     _controller2 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation2 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller2);
//
//     _controller3 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation3 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller3);
//
//     _controller2.forward().then((_) {
//       _controller1.forward();
//       _controller3.forward();
//     });
//
//     _controller1.addListener(() {
//       if (_controller1.isCompleted) {
//         _controller1.reverse();
//       }
//     });
//
//     _controller3.addListener(() {
//       if (_controller3.isCompleted) {
//         _controller3.reverse();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller1.dispose();
//     _controller2.dispose();
//     _controller3.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//       AnimatedBuilder(
//         animation: _animation1,
//         builder: (BuildContext context, Widget? child) {
//           return Transform.scale(
//             scale: _animation1.value,
//             child: SizedBox(
//               width: 100.0,
//               height: 100.0,
//               child: Image.asset(
//                 'assets/images/ic_scored_text_upper.png',
//               ),
//             ),
//           );
//         },
//       ),
//       SizedBox(height: 12.0),
//       AnimatedBuilder(
//         animation: _animation2,
//         builder: (BuildContext context, Widget? child) {
//           return Transform.scale(
//             scale: _animation2.value,
//             child: SizedBox(
//               width: 100.0,
//               height: 100.0,
//               child: Image.asset(
//                 'assets/images/ic_scored.png',
//               ),
//             ),
//           );
//         },
//       ),
//       SizedBox(height: 12.0),
//       AnimatedBuilder(
//           animation: _animation3,
//           builder: (BuildContext context, Widget? child) {
//             return Transform.scale(
//               scale: _animation3.value,
//               child: SizedBox(
//                 width: 100.0,
//                 height: 100.0,
//                 child: Image.asset(
//                   'assets/images/ic_scored_text_below.png',
//                 ),
//               ),
//             );
//           })
//     ])));
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageOverlay extends StatefulWidget {
//   @override
//   _ImageOverlayState createState() => _ImageOverlayState();
// }
//
// class _ImageOverlayState extends State<ImageOverlay>
//     with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late Animation<double> _animation1;
//   late AnimationController _controller2;
//   late Animation<double> _animation2;
//   late AnimationController _controller3;
//   late Animation<double> _animation3;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller1 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation1 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller1);
//
//     _controller2 = AnimationController(
//       duration: Duration(milliseconds: 1500),
//       vsync: this,
//     );
//
//     _animation2 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller2);
//
//     _controller3 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation3 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller3);
//
//     _controller2.forward().then((_) {
//       _controller1.forward();
//       _controller3.forward();
//     });
//
//     _controller1.addListener(() {
//       if (_controller1.isCompleted) {
//         _controller1.reverse();
//       }
//     });
//
//     _controller3.addListener(() {
//       if (_controller3.isCompleted) {
//         _controller3.reverse();
//       }
//     });
//    }
//
//   @override
//   void dispose() {
//     _controller1.dispose();
//     _controller2.dispose();
//     _controller3.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child:
//             Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               AnimatedBuilder(
//                 animation: _animation1,
//                 builder: (BuildContext context, Widget? child) {
//                   return Transform.scale(
//                     scale: _animation1.value,
//                     child: SizedBox(
//                       width: 100.0,
//                       height: 100.0,
//                       child: Image.asset(
//                         'assets/images/ic_scored_text_upper.png',
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 12.0),
//               AnimatedBuilder(
//                 animation: _animation2,
//                 builder: (BuildContext context, Widget? child) {
//                   return Transform.scale(
//                     scale: _animation2.value,
//                     child: SizedBox(
//                       width: 100.0,
//                       height: 100.0,
//                       child: Image.asset(
//                         'assets/images/ic_scored.png',
//                       ),
//                     ),
//                   );
//
//                 },
//               ),
//               SizedBox(height: 12.0),
//               AnimatedBuilder(
//                   animation: _animation3,
//                   builder: (BuildContext context, Widget? child) {
//                     return Transform.scale(
//                       scale: _animation3.value,
//                       child: SizedBox(
//                         width: 100.0,
//                         height: 100.0,
//                         child: Image.asset(
//                           'assets/images/ic_scored_text_below.png',
//                         ),
//                       ),
//                     );
//                   })
//             ])));
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageOverlay extends StatefulWidget {
//   @override
//   _ImageOverlayState createState() => _ImageOverlayState();
// }
//
// class _ImageOverlayState extends State<ImageOverlay>
//     with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late Animation<double> _animation1;
//   late AnimationController _controller2;
//   late Animation<double> _animation2;
//   late AnimationController _controller3;
//   late Animation<double> _animation3;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller1 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation1 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller1);
//
//     //_controller1.repeat(reverse: true);
//
//     _controller2 = AnimationController(
//       duration: Duration(milliseconds: 1500),
//       vsync: this,
//     );
//
//     _animation2 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller2);
//
//     _controller3 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation3 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller3);
//    // _controller3.repeat(reverse: true);
//
//     _controller2.forward().then((_) {
//       _controller1.forward();
//       _controller1.repeat(reverse: true);
//       _controller3.repeat(reverse: true);
//     });
//
//     //   _controller1.addListener(() {
//     //     if (_controller1.isCompleted) {
//     //       _controller1.reverse();
//     //     }
//     //   });
//     //
//     //   _controller3.addListener(() {
//     //     if (_controller3.isCompleted) {
//     //       _controller3.reverse();
//     //     }
//     //   });
//      }

//     @override
//     void dispose() {
//       _controller1.dispose();
//       _controller2.dispose();
//       _controller3.dispose();
//       super.dispose();
//     }
//
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AnimatedBuilder(
//                 animation: _animation1,
//                 builder: (BuildContext context, Widget? child) {
//                   return Transform.scale(
//                     scale: _animation1.value,
//                     child: SizedBox(
//                       width: 80.0,
//                       height: 80.0,
//                       child: Image.asset(
//                         'assets/images/ic_scored_text_upper.png',
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 2.0),
//               AnimatedBuilder(
//                 animation: _animation2,
//                 builder: (BuildContext context, Widget? child) {
//                   return Transform.scale(
//                     scale: _animation2.value,
//                     child: SizedBox(
//                       width: 80.0,
//                       height: 80.0,
//                       child: Image.asset(
//                         'assets/images/ic_scored.png',
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 2.0),
//               AnimatedBuilder(
//                 animation: _animation3,
//                 builder: (BuildContext context, Widget? child) {
//                   return Transform.scale(
//                     scale: _animation3.value,
//                     child: SizedBox(
//                       width: 80.0,
//                       height: 80.0,
//                       child: Image.asset(
//                         'assets/images/ic_scored_text_below.png',
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }


// class _ImageOverlayState extends State<ImageOverlay> with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late Animation<double> _animation1;
//   late AnimationController _controller2;
//   late Animation<double> _animation2;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller1 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     _animation1 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller1);
//
//     _controller2 = AnimationController(
//       duration: Duration(milliseconds: 1500),
//       vsync: this,
//     );
//
//     _animation2 = Tween<double>(
//       begin: 1.0,
//       end: 1.5,
//     ).animate(_controller2);
//
//     _controller2.forward().then((_) {
//       _controller1.repeat(reverse: true); // Modify controller to loop continuously
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller1.dispose();
//     _controller2.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: _animation1,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation1.value,
//                   child: SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.asset(
//                       'assets/images/ic_scored_text_upper.png',
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 12.0),
//             AnimatedBuilder(
//               animation: _animation2,
//               builder: (BuildContext context, Widget? child) {
//                 return Transform.scale(
//                   scale: _animation2.value,
//                   child: SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.asset(
//                       'assets/images/ic_scored.png',
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

