// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'dart:io';
// import '../Colors/colors.dart';
//
// class SampleShare extends StatefulWidget {
//
//   SampleShare({super.key});
//   @override
//   _SampleShareState createState() => _SampleShareState();
// }
// Future<void> shareImage() async {
//   ByteData imageData = await rootBundle.load('assets/images/ic_qrcode.png');
//   Uint8List bytes = imageData.buffer.asUint8List();
//
//   Directory tempDir = await getTemporaryDirectory();
//   String tempPath = tempDir.path;
//   String imagePath = '$tempPath/ic_qrcode.png';
//   File imageFile = File(imagePath);
//   await imageFile.writeAsBytes(bytes);
//   await Share.shareXFiles(
//     [XFile(imagePath)],
//     text: "test",);
// }
// // // class _SampleShareState extends State<SampleShare> {
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         backgroundColor: commonBackground,
// // //         body: SafeArea(
// // //           child: Column(
// // //             children: <Widget>[
// // //               ElevatedButton(
// // //                   onPressed: () async
// // //                   {
// // //                     shareImage();
// // //
// // //                     // // const docimage='assets/images/ic_qrcode.png';
// // //                     // final uri=Uri.parse('https://assets/images/ic_qrcode.png');
// // //                     // final response=await get(uri);
// // //                     // final bytes=response.bodyBytes;
// // //                     // final temp=await getTemporaryDirectory();
// // //                     // final path='${temp.path}/ic_qrcode.png';
// // //                     // final file = File(path);
// // //                     // if (await file.exists()) {
// // //                     //   await Share.share(
// // //                     //     (path),
// // //                     //     subject: "DaKanji feedback",);
// // //                   },
// // //
// // //
// // //                   child: const Text('Share')
// // //               ),
// // //
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:http/http.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:share_plus/share_plus.dart';
// // import 'dart:io';
// // import '../Colors/colors.dart';
// //
// // class SampleShare extends StatefulWidget {
// //
// //   SampleShare({super.key});
// //   @override
// //   _SampleShareState createState() => _SampleShareState();
// // }
// // Future<void> shareImage() async {
// //   ByteData imageData = await rootBundle.load('assets/images/ic_qrcode.png');
// //   Uint8List bytes = imageData.buffer.asUint8List();
// //
// //   Directory tempDir = await getTemporaryDirectory();
// //   String tempPath = tempDir.path;
// //   String imagePath = '$tempPath/ic_qrcode.png';
// //   File imageFile = File(imagePath);
// //   await imageFile.writeAsBytes(bytes);
// //   await Share.shareXFiles(
// //     [XFile(imagePath)],
// //     text: "test",);
// // }
// class _SampleShareState extends State<SampleShare> {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: commonBackground,
//         body: SafeArea(
//           child: Column(
//             children: <Widget>[
//               ElevatedButton(
//                   onPressed: () async
//                   {
//                     shareImage();
//
//                     // // const docimage='assets/images/ic_qrcode.png';
//                     // final uri=Uri.parse('https://assets/images/ic_qrcode.png');
//                     // final response=await get(uri);
//                     // final bytes=response.bodyBytes;
//                     // final temp=await getTemporaryDirectory();
//                     // final path='${temp.path}/ic_qrcode.png';
//                     // final file = File(path);
//                     // if (await file.exists()) {
//                     //   await Share.share(
//                     //     (path),
//                     //     subject: "DaKanji feedback",);
//                   },
//
//
//                   child: const Text('Share')
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:share/share.dart';
//
// void main() => runApp(QRCodeApp());
//
// class QRCodeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QR Code Generator',
//       home: QRCodeScreen(),
//     );
//   }
// }
//
// class QRCodeScreen extends StatelessWidget {
//   String userId = "123456"; // Replace with your actual user ID
//
//   // Generate QR code data with user ID and current time
//   String generateQRCodeData() {
//     DateTime now = DateTime.now();
//     String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
//     return "$userId\n$formattedDateTime";
//   }
//
//   // Share QR code image
//   void shareQRCode() async {
//     String qrData = generateQRCodeData();
//
//     // Generate QR code image bytes
//     final qrImageData = await QrPainter(
//       data: qrData,
//       version: QrVersions.auto,
//       gapless: false,
//       color: Colors.black,
//       emptyColor: Colors.white,
//     ).toImageData(200.0);
//
//     // Save QR code image bytes to temporary file
//     final tempDir = await getTemporaryDirectory();
//     final tempFile = File('${tempDir.path}/qr_code.png');
//     await tempFile.writeAsBytes(qrImageData?.buffer.asUint8List() as List<int>);
//
//     // Share QR code image file
//     Share.shareFiles([tempFile.path], text: 'QR Code.png');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String qrData = generateQRCodeData();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code Generator'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             QrImage(
//               data: qrData,
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () => shareQRCode(),
//               child: Text('Share QR Code'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class BlinkingImage extends StatefulWidget {
//
//
//   BlinkingImage({required this.duration});
//
//   final Duration duration;
//
//   @override
//   _BlinkingImageState createState() => _BlinkingImageState();
// }
//
// class _BlinkingImageState extends State<BlinkingImage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _opacityAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: widget.duration,
//     )..repeat(reverse: true);
//     _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _opacityAnimation,
//       builder: (context, child) {
//         return Opacity(
//           opacity: _opacityAnimation.value,
//           child: Image.asset('assets/images/ic_scored_one.png')
//         );
//       },
//     );
//   }
// }



// import 'package:flutter/material.dart';
//
// class ImageSplash extends StatefulWidget {
//   @override
//   _ImageSplashState createState() => _ImageSplashState();
// }
//
// class _ImageSplashState extends State<ImageSplash>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _rotation1Animation;
//   late Animation<double> _rotation2Animation;
//   late Animation<double> _textSplashAnimation;
//   late Animation<double> _opacityAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     );
//
//     _rotation1Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.0, 0.25, curve: Curves.easeInOut),
//       ),
//     );
//
//     _rotation2Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
//       ),
//     );
//
//     _textSplashAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.5, 0.75, curve: Curves.easeInOut),
//       ),
//     );
//
//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.75, 1.0, curve: Curves.easeInOut),
//       ),
//     );
//
//     _controller.repeat(reverse: true);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Center(
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Transform.rotate(
//               angle: _rotation1Animation.value * 2 * 3.14,
//               child: Transform.rotate(
//                 angle: _rotation2Animation.value * 2 * 3.14,
//                 child: Opacity(
//                   opacity: _opacityAnimation.value,
//                   child: Image.asset(
//                     'assets/images/ic_scored_one.png',// Replace with your image path
//                     width: 150,
//                     height: 150,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

//

// import 'package:flutter/material.dart';
//
// class ImageSplash extends StatefulWidget {
//   @override
//   _ImageSplashState createState() => _ImageSplashState();
// }
//
// class _ImageSplashState extends State<ImageSplash>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _rotation1Animation;
//   late Animation<double> _rotation2Animation;
//   late Animation<double> _textSplashAnimation;
//   late Animation<double> _opacityAnimation;
//
//   bool _isAnimating = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     );
//
//     _rotation1Animation = Tween<double>(begin: 0.0, end: -1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
//       ),
//     );
//
//     _rotation2Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
//       ),
//     );
//
//     _textSplashAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.75, 1.0, curve: Curves.easeInOut),
//       ),
//     );
//
//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.75, 1.0, curve: Curves.easeInOut),
//       ),
//     );
//
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed && _isAnimating) {
//         _controller.reset();
//         _controller.forward();
//       }
//     });
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _toggleAnimation() {
//     setState(() {
//       _isAnimating = !_isAnimating;
//       if (_isAnimating) {
//         _controller.reset();
//         _controller.forward();
//       } else {
//         _controller.stop();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleAnimation,
//       child: Container(
//         color: Colors.white,
//         child: Center(
//           child: AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return Transform.rotate(
//                 angle: _rotation1Animation.value * 2 * 3.14,
//                 child: Transform.rotate(
//                   angle: _rotation2Animation.value * 2 * 3.14,
//                   child: Opacity(
//                     opacity: _opacityAnimation.value,
//                     child: Image.asset(
//                       'assets/images/ic_scored_one.png', // Replace with your image path
//                       width: 200,
//                       height: 200,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageSplash extends StatefulWidget {
//   @override
//   _ImageSplashState createState() => _ImageSplashState();
// }
//
// class _ImageSplashState extends State<ImageSplash>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _rotation1Animation;
//   late Animation<double> _rotation2Animation;
//   late Animation<double> _opacityAnimation;
//   late Animation<double> _rotation3Animation;
//
//   bool _isAnimating = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     );
//
//     _rotation1Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.0, 0.25, curve: Curves.easeInOut),
//       ),
//     );
//
//     _rotation2Animation = Tween<double>(begin: 0.0, end: -1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
//       ),
//     );
//
//     _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.5, 0.75, curve: Curves.easeInOut),
//       ),
//     );
//
//     _rotation3Animation = Tween<double>(begin: 0.0, end: -0.5).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.75, 1.0, curve: Curves.easeInOut),
//       ),
//     );
//
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed && _isAnimating) {
//         setState(() {
//           _isAnimating = false;
//         });
//       }
//     });
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _toggleAnimation() {
//     setState(() {
//       if (!_isAnimating) {
//         _isAnimating = true;
//         _controller.reset();
//         _controller.forward();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleAnimation,
//       child: Container(
//         color: Colors.white,
//         child: Center(
//           child: AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return Transform.rotate(
//                 angle: _rotation1Animation.value * 2 * 3.14,
//                 child: Transform.rotate(
//                   angle: _rotation2Animation.value * 2 * 3.14,
//                   child: Opacity(
//                     opacity: _opacityAnimation.value,
//                     child: Transform.rotate(
//                       angle: _rotation3Animation.value * 2 * 3.14,
//                       child: Image.asset(
//                         'assets/images/ic_scored_one.png', // Replace with your image path
//                         width: 200,
//                         height: 200,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageSplash extends StatefulWidget {
//   @override
//   _ImageSplashState createState() => _ImageSplashState();
// }
//
// class _ImageSplashState extends State<ImageSplash>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _rotation1Animation;
//   late Animation<double> _rotation2Animation;
//   late Animation<double> _opacityAnimation;
//   late Animation<double> _rotation3Animation;
//
//   bool _isAnimating = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: Duration(seconds: 6),
//       vsync: this,
//     );
//
//     _rotation1Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.10, 0.25, curve: Curves.easeInOut),
//       ),
//     );
//
//     _rotation2Animation = Tween<double>(begin: 0.0, end: -0.2).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
//       ),
//     );
//
//     _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.15, 0.75, curve: Curves.easeInOut),
//       ),
//     );
//
//
//
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed && _isAnimating) {
//         setState(() {
//           _isAnimating = false;
//         });
//       }
//     });
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _toggleAnimation() {
//     setState(() {
//       if (!_isAnimating) {
//         _isAnimating = true;
//         _controller.reset();
//         _controller.forward();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleAnimation,
//       child: Container(
//         color: Colors.white,
//         child: Center(
//           child: AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return Transform.rotate(
//                 angle: _rotation1Animation.value * 3 * 3.14,
//                 child: Transform.rotate(
//                   angle: _rotation2Animation.value * 3 * 3.14,
//                   child: Opacity(
//                     opacity: _opacityAnimation.value,
//                       child: Image.asset(
//                         'assets/images/ic_scored_one.png', // Replace with your image path
//                         width: 200,
//                         height: 200,
//                       ),
//                     ),
//                   ),
//                 );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class ImageRotationAnimation extends StatefulWidget {
//   @override
//   _ImageRotationAnimationState createState() => _ImageRotationAnimationState();
// }
//
// class _ImageRotationAnimationState extends State<ImageRotationAnimation> with TickerProviderStateMixin {
//   late AnimationController _rotationController;
//   late Animation<double> _rotationAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a rotation animation controller
//     _rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of each partial rotation
//     );
//
//     // Create a tween animation for the rotation effect
//     _rotationAnimation = Tween<double>(begin: -0.5, end: 0.5).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController.reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController.forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Start the left rotation animation
//     _rotationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _rotationController.dispose();
//     super.dispose();
//   }
//
//   void _startRightRotationAnimation() {
//     // Stop the left rotation animation
//     _rotationController.stop();
//
//     // Set the rotation animation to start from 0.5 radians to -0.5 radians in reverse
//     _rotationAnimation = Tween<double>(begin: 0.5, end: -0.5).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController.reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController.forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Start the right rotation animation
//     _rotationController.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _rotationAnimation,
//           builder: (context, child) {
//             return Transform.rotate(
//               angle: _rotationAnimation.value, // Get the current rotation value from the animation
//               child: GestureDetector(
//                 onTap: _startRightRotationAnimation, // Trigger the right rotation animation on tap
//                 child: Image.asset(
//                   'assets/images/ic_scored_one.png', // Replace with your image asset
//                   width: 200, // Set the width of the image
//                   height: 200, // Set the height of the image
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class ImageBlinkAndRotationAnimation extends StatefulWidget {
//   @override
//   _ImageBlinkAndRotationAnimationState createState() => _ImageBlinkAndRotationAnimationState();
// }
//
// class _ImageBlinkAndRotationAnimationState extends State<ImageBlinkAndRotationAnimation> with TickerProviderStateMixin {
//   late AnimationController _blinkController;
//   late Animation<double> _blinkAnimation;
//   late AnimationController _rotationController;
//   late Animation<double> _rotationAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a blink animation controller
//     _blinkController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500), // Set the duration of the blink animation
//     );
//
//     // Create a tween animation for the opacity effect
//     _blinkAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_blinkController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _blinkController.reverse(); // Reverse the blink animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _blinkController.forward(); // Forward the blink animation when it dismisses
//         }
//       });
//
//     // Create a rotation animation controller
//     _rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of each partial rotation
//     );
//
//     // Create a tween animation for the rotation effect
//     _rotationAnimation = Tween<double>(begin: -0.5, end: 0.5).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController.reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController.forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Start the blink animation at startup
//     _blinkController.forward().whenComplete(() {
//       // After the blink animation completes, start the rotation animation and stop the blink animation
//       _rotationController.forward();
//       _blinkController.stop();
//     });
//   }
//
//   @override
//   void dispose() {
//     _blinkController.dispose();
//     _rotationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _rotationAnimation,
//           builder: (context, child) {
//             return Transform.rotate(
//               angle: _rotationAnimation.value, // Get the current rotation value from the animation
//               child: Opacity(
//                 opacity: _blinkAnimation.value, // Get the current opacity value from the blink animation
//                 child: GestureDetector(
//                   onTap: () {}, // Placeholder onTap function, you can replace it with your own logic
//                   child: Image.asset(
//                     'assets/images/ic_scored_one.png', // Replace with your image asset
//                     width: 200, // Set the width of the image
//                     height: 200, // Set the height of the image
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageBlinkAndStableAnimation extends StatefulWidget {
//   @override
//   _ImageBlinkAndStableAnimationState createState() => _ImageBlinkAndStableAnimationState();
// }
//
// class _ImageBlinkAndStableAnimationState extends State<ImageBlinkAndStableAnimation> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _opacityAnimation;
//   bool _isVisible = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create an animation controller
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of the blink animation
//     );
//
//     // Create a tween animation for the opacity effect
//     _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_animationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             _isVisible = false; // Set the visibility of the image to false when the animation completes
//           });
//         } else if (status == AnimationStatus.dismissed) {
//           setState(() {
//             _isVisible = true; // Set the visibility of the image to true when the animation dismisses
//           });
//         }
//       });
//
//     // Start the blink animation at startup
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _opacityAnimation,
//           builder: (context, child) {
//             return Opacity(
//               opacity: _isVisible ? _opacityAnimation.value : 1.0, // Apply the opacity animation only when the image is visible
//               child: Image.asset(
//                 'assets/images/ic_scored_one.png', // Replace with your image asset
//                 width: 200, // Set the width of the image
//                 height: 200, // Set the height of the image
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';

// class BlinkingRotatingImage extends StatefulWidget {
//   final ImageProvider image;
//
//   BlinkingRotatingImage({required this.image});
//
//   @override
//   _BlinkingRotatingImageState createState() => _BlinkingRotatingImageState();
// }
//
// class _BlinkingRotatingImageState extends State<BlinkingRotatingImage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacityAnimation;
//   late Animation<double> _rotationAnimation;
//
//   bool _isBlinkingComplete = false;
//   bool _isRotatingRightToLeft = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // Create an animation controller with duration of 1 second
//     _controller = AnimationController(duration: Duration(seconds: 1), vsync: this)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             _isBlinkingComplete = true;
//           });
//           // After blinking is complete, wait for 1 second and then start rotation animation
//           Future.delayed(Duration(seconds: 1), () {
//             setState(() {
//               _isBlinkingComplete = false;
//             });
//             _controller.duration = Duration(seconds: 2);
//             _controller.reset();
//             _controller.forward();
//           });
//         }
//       });
//
//     // Create an opacity animation that goes from 0.0 to 1.0 and back repeatedly
//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//
//     // Create a rotation animation that rotates the image from -0.25*pi (-45 degrees) to 0.25*pi (45 degrees) and then back to -0.25*pi (-45 degrees)
//     _rotationAnimation = Tween<double>(begin: -0.25 * pi, end: 0.25 * pi).animate(_controller)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             _isRotatingRightToLeft = true;
//           });
//           _controller.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           setState(() {
//             _isRotatingRightToLeft = false;
//           });
//           _controller.forward();
//         }
//       });
//
//     // Start the animation
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _rotationAnimation,
//       builder: (context, child) {
//         return Transform.rotate(
//           angle: _isRotatingRightToLeft ? -_rotationAnimation.value : _rotationAnimation.value,
//           child: Opacity(
//             opacity: _isBlinkingComplete ? 1.0 : _opacityAnimation.value,
//             child: Image(image: widget.image),
//           ),
//         );
//       },
//     );
//   }
// }
// import 'dart:math';
// import 'package:flutter/material.dart';
//
// class BlinkingRotatingImage extends StatefulWidget {
//   final ImageProvider image;
//
//   BlinkingRotatingImage({required this.image});
//
//   @override
//   _BlinkingRotatingImageState createState() => _BlinkingRotatingImageState();
// }
//
// class _BlinkingRotatingImageState extends State<BlinkingRotatingImage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacityAnimation;
//   late Animation<double> _rotationAnimation;
//
//   bool _isBlinkingComplete = false;
//   bool _isRotatingRightToLeft = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // Create an animation controller with duration of 1 second
//     _controller = AnimationController(duration: Duration(seconds: 1), vsync: this)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             _isBlinkingComplete = true;
//           });
//           // After blinking is complete, wait for 1 second and then start rotation animation
//           Future.delayed(Duration(seconds: 1), () {
//             setState(() {
//               _isBlinkingComplete = false;
//             });
//             _controller.duration = Duration(seconds: 2);
//             _controller.reset();
//             _controller.forward();
//           });
//         }
//       });
//
//     // Create an opacity animation that goes from 0.0 to 1.0 and back repeatedly
//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//
//     // Create a rotation animation that rotates the image from -0.25*pi (-45 degrees) to 0.25*pi (45 degrees) and then back to -0.25*pi (-45 degrees)
//     _rotationAnimation = Tween<double>(begin: -0.25 * pi, end: 0.25 * pi).animate(_controller)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             _isRotatingRightToLeft = true;
//           });
//           _controller.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           setState(() {
//             _isRotatingRightToLeft = false;
//           });
//           _controller.forward();
//         }
//       });
//
//     // Start the animation
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _rotationAnimation,
//       builder: (context, child) {
//         return Transform.rotate(
//           angle: _isRotatingRightToLeft ? -_rotationAnimation.value : _rotationAnimation.value,
//           child: Opacity(
//             opacity: _isBlinkingComplete ? 1.0 : _opacityAnimation.value,
//             child: Image(image: widget.image),
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageRotationAnimation extends StatefulWidget {
//   @override
//   _ImageRotationAnimationState createState() => _ImageRotationAnimationState();
// }
//
// class _ImageRotationAnimationState extends State<ImageRotationAnimation> with TickerProviderStateMixin {
//   late AnimationController _rotationController;
//   late Animation<double> _rotationAnimation;
//   late Animation<double> _opacityAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a rotation animation controller
//     _rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of each partial rotation
//     );
//
//     // Create a tween animation for the rotation effect
//     _rotationAnimation = Tween<double>(begin: -0.5, end: 0.5).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController.reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController.forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Create a tween sequence animation for the opacity effect
//     _opacityAnimation = TweenSequence<double>([
//       TweenSequenceItem<double>(
//         tween: Tween<double>(begin: 1.0, end: 0.0),
//         weight: 1,
//       ),
//       TweenSequenceItem<double>(
//         tween: Tween<double>(begin: 0.0, end: 1.0),
//         weight: 1,
//       ),
//     ]).animate(_rotationController);
//
//     // Start the left rotation animation
//     _rotationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _rotationController.dispose();
//     super.dispose();
//   }
//
//   void _startRightRotationAnimation() {
//     // Stop the left rotation animation
//     _rotationController.stop();
//
//     // Set the rotation animation to start from 0.5 radians to -0.5 radians in reverse
//     _rotationAnimation = Tween<double>(begin: 0.5, end: -0.5).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController.reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController.forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Start the right rotation animation
//     _rotationController.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _rotationAnimation,
//           builder: (context, child) {
//             return Opacity(
//               opacity: _opacityAnimation.value, // Get the current opacity value from the animation
//               child: Transform.rotate(
//                 angle: _rotationAnimation.value, // Get the current rotation value from the animation
//                 child: GestureDetector(
//                   onTap: _startRightRotationAnimation, // Trigger the right rotation animation on tap
//                   child: Image.asset(
//                     'assets/images/ic_scored_one.png', // Replace with your image asset
//                     width: 200, // Set the width of the image
//                     height: 200, // Set the height of the image
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class ImageRotationAnimation extends StatefulWidget {
//   @override
//   _ImageRotationAnimationState createState() => _ImageRotationAnimationState();
// }
//
// class _ImageRotationAnimationState extends State<ImageRotationAnimation> with TickerProviderStateMixin {
//   late AnimationController _rotationController;
//   late Animation<double> _rotationAnimation;
//   late Animation<double> _opacityAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a rotation animation controller
//     _rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of each partial rotation
//     );
//
//     // Create a tween animation for the rotation effect
//     _rotationAnimation = Tween<double>(begin: -0.5, end: 0.5).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController.reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController.forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Create a tween animation for the opacity effect
//     _opacityAnimation = Tween<double>(begin: 1.0, end: 1.0).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_rotationController); // Update the opacity animation to fade in after the initial fade out
//         }
//       });
//
//     // Start the left rotation animation
//     _rotationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _rotationController.dispose();
//     super.dispose();
//   }
//
//   void _startRightRotationAnimation() {
//     // Stop the left rotation animation
//     _rotationController.stop();
//
//     // Set the rotation animation to start from 0.5 radians to -0.5 radians in reverse
//     _rotationAnimation = Tween<double>(begin: 0.5, end: -0.5).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController.reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController.forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Start the right rotation animation
//     _rotationController.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _rotationAnimation,
//           builder: (context, child) {
//             return Opacity(
//               opacity: _opacityAnimation.value, // Get the current opacity value from the animation
//               child: Transform.rotate(
//                 angle: _rotationAnimation.value, // Get the current rotation value from the animation
//                 child: GestureDetector(
//                   onTap: _startRightRotationAnimation, // Trigger the right rotation animation on tap
//                   child: Image.asset(
//                     'assets/images/ic_scored_one.png', // Replace with your image asset
//                     width: 200, // Set the width of the image
//                     height: 200, // Set the height of the image
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class ImageRotationAnimation extends StatefulWidget {
//   @override
//   _ImageRotationAnimationState createState() => _ImageRotationAnimationState();
// }
// class _ImageRotationAnimationState extends State<ImageRotationAnimation> with TickerProviderStateMixin {
//   late AnimationController _rotationController;
//   late Animation<double> _rotationAnimation;
//   late Animation<double> _opacityAnimation;
//   double _imageWidth = 100.0; // Initial width of the image
//   double _imageHeight = 100.0; // Initial height of the image
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a rotation animation controller
//     _rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(
//           seconds: 2), // Set the duration of each partial rotation
//     );
//
//     // Create a tween animation for the rotation effect
//     _rotationAnimation =
//     Tween<double>(begin: -0.5, end: 0.5).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController
//               .reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController
//               .forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Create a tween animation for the opacity effect
//     _opacityAnimation =
//     Tween<double>(begin: 0.0, end: 1.0).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             _imageWidth =
//             200.0; // Update the image width to actual size after fade-in
//             _imageHeight =
//             200.0; // Update the image height to actual size after fade-in
//           });
//         }
//       });
//
//     // Start the left rotation animation
//     _rotationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _rotationController.dispose();
//     super.dispose();
//   }
//
//   void _startRightRotationAnimation() {
//     // Stop the left rotation animation
//     _rotationController.stop();
//
//     // Set the rotation animation to start from 0.5 radians to -0.5 radians in reverse
//     _rotationAnimation =
//     Tween<double>(begin: 0.5, end: -0.5).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController
//               .reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController
//               .forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Start the right rotation animation
//     _rotationController.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: AnimatedBuilder(
//                 animation: _rotationAnimation,
//                 builder: (context, child) {
//                   return Opacity(
//                       opacity: _opacityAnimation.value,
//                       // Get the current opacity value from the animation
//                       child: Transform.rotate(
//                         angle: _rotationAnimation.value,
//                         // Get the current rotation value from the animation
//                         child: GestureDetector(
//                           onTap: _startRightRotationAnimation,
//                           // Trigger the right rotation animation on tap
//                           child: Image.asset(
//                             'assets/images/ic_scored_one.png',
//                             // Replace with your image asset
//                             width: _imageWidth, // Set the width of the image
//                             height: _imageHeight, // Set the height of the image
//                           ),
//                         ),
//                       ));
//                 })));
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageRotationAnimation extends StatefulWidget {
//   @override
//   _ImageRotationAnimationState createState() => _ImageRotationAnimationState();
// }
//
// class _ImageRotationAnimationState extends State<ImageRotationAnimation> with TickerProviderStateMixin {
//   late AnimationController _rotationController;
//   late Animation<double> _rotationAnimation;
//   late Animation<double> _opacityAnimation;
//   double _imageWidth = 0.0; // Initial width of the image
//   double _imageHeight = 0.0; // Initial height of the image
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a rotation animation controller
//     _rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of each partial rotation
//     );
//
//     // Create a tween animation for the rotation effect
//     _rotationAnimation = Tween<double>(begin: -0.5, end: 0.5).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController.reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController.forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Create a tween animation for the opacity effect
//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _rotationController,
//         curve: Interval(0.0, 0.5, curve: Curves.easeIn), // Use ease-in curve for fading in
//       ),
//     )..addListener(() {
//       setState(() {});
//     });
//
//     // Start the rotation animation
//     _rotationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _rotationController.dispose();
//     super.dispose();
//   }
//
//   void _resetAnimation() {
//     // Stop the rotation animation
//     _rotationController.stop();
//
//     setState(() {
//       _imageWidth = 0.0; // Reset the image width to 0
//       _imageHeight = 0.0; // Reset the image height to 0
//     });
//
//     // Start the rotation animation again
//     _rotationController.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _rotationAnimation,
//           builder: (context, child) {
//             return Opacity(
//               opacity: _opacityAnimation.value,
//               // Get the current opacity value from the animation
//               child: Transform.rotate(
//                 angle: _rotationAnimation.value,
//                 // Get the current rotation value from the animation
//                 child: GestureDetector(
//                   onTap: _resetAnimation,
//                   // Trigger the animation reset on tap
//                   child: Image.asset(
//                     'assets/images/ic_scored_one.png',
//                     // Replace with your image asset
//                     width: _imageWidth, // Set the width of the image
//                     height: _imageHeight, // Set the height of the image
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

//


// import 'package:flutter/material.dart';
//
// class ImageScaleAnimation extends StatefulWidget {
//   @override
//   _ImageScaleAnimationState createState() => _ImageScaleAnimationState();
// }
//
// class _ImageScaleAnimationState extends State<ImageScaleAnimation> with TickerProviderStateMixin {
//   late AnimationController _scaleController;
//   late Animation<double> _scaleAnimation;
//   double _imageWidth = 100.0; // Initial width of the image
//   double _imageHeight = 100.0; // Initial height of the image
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a scale animation controller
//     _scaleController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of the scale animation
//     );
//
//     // Create a tween animation for the scale effect
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(_scaleController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             _imageWidth = 200.0; // Update the image width to the scaled size
//             _imageHeight = 200.0; // Update the image height to the scaled size
//           });
//           _scaleController.reverse(); // Reverse the scale animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           setState(() {
//             _imageWidth = 100.0; // Reset the image width to the original size
//             _imageHeight = 100.0; // Reset the image height to the original size
//           });
//           _scaleController.forward(); // Forward the scale animation when it dismisses
//         }
//       });
//
//     // Start the scale animation
//     _scaleController.forward();
//   }
//
//   @override
//   void dispose() {
//     _scaleController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _scaleAnimation,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: _scaleAnimation.value,
//               // Get the current scale value from the animation
//               child: GestureDetector(
//                 onTap: () {}, // Empty onTap function to prevent gesture conflicts
//                 child: Image.asset(
//                   'assets/images/ic_scored_one.png',
//                   // Replace with your image asset
//                   width: _imageWidth, // Set the width of the image
//                   height: _imageHeight, // Set the height of the image
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageScaleAnimation extends StatefulWidget {
//   @override
//   _ImageScaleAnimationState createState() => _ImageScaleAnimationState();
// }
//
// class _ImageScaleAnimationState extends State<ImageScaleAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _scaleController;
//   late Animation<double> _scaleAnimation;
//   double _imageWidth = 100.0; // Initial width of the image
//   double _imageHeight = 100.0; // Initial height of the image
//   double _rotationValue = 0.0; // Initial rotation value of the image
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a scale animation controller
//     _scaleController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of the scale animation
//     );
//
//     // Create a tween animation for the scale effect
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(_scaleController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             _imageWidth = 200.0; // Update the image width to the scaled size
//             _imageHeight = 200.0; // Update the image height to the scaled size
//             _rotationValue = 0.5; // Update the rotation value to the front
//           });
//           _scaleController.reverse(); // Reverse the scale animation when it completes
//         }
//       });
//
//     // Start the scale animation
//     _scaleController.forward();
//   }
//
//   @override
//   void dispose() {
//     _scaleController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _scaleAnimation,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: _scaleAnimation.value,
//               // Get the current scale value from the animation
//               child: Transform.rotate(
//                 angle: _rotationValue,
//                 // Get the current rotation value from the animation
//                 child: GestureDetector(
//                   onTap: () {}, // Empty onTap function to prevent gesture conflicts
//                   child: Image.asset(
//                     'assets/images/ic_scored_one.png',
//                     // Replace with your image asset
//                     width: _imageWidth, // Set the width of the image
//                     height: _imageHeight, // Set the height of the image
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ImageScaleAnimation extends StatefulWidget {
//   @override
//   _ImageScaleAnimationState createState() => _ImageScaleAnimationState();
// }
//
// class _ImageScaleAnimationState extends State<ImageScaleAnimation> with TickerProviderStateMixin {
//   late AnimationController _scaleController;
//   late Animation<double> _scaleAnimation;
//   late AnimationController _rotationController;
//   late Animation<double> _rotationAnimation;
//   double _imageWidth = 100.0; // Initial width of the image
//   double _imageHeight = 100.0; // Initial height of the image
//   bool _isScaled = false; // Variable to keep track of image scaling
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a scale animation controller
//     _scaleController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of the scale animation
//     );
//
//     // Create a tween animation for the scale effect
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(_scaleController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             _isScaled = true; // Set the flag to indicate image is scaled
//           });
//           _scaleController.reverse(); // Reverse the scale animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           setState(() {
//             _isScaled = false; // Reset the flag to indicate image is not scaled
//           });
//           _scaleController.forward(); // Forward the scale animation when it dismisses
//         }
//       });
//
//     // Create a rotation animation controller
//     _rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1), // Set the duration of the rotation animation
//     );
//
//     // Create a tween animation for the rotation effect
//     _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_rotationController);
//
//     // Start the scale animation
//     _scaleController.forward();
//   }
//
//   @override
//   void dispose() {
//     _scaleController.dispose();
//     _rotationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _scaleAnimation,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: _isScaled ? _scaleAnimation.value : 1.0, // Apply scaling only if image is scaled
//               child: GestureDetector(
//                 onTap: () {
//                   // Start the rotation animation when image is tapped
//                   if (_isScaled) {
//                     if (_rotationController.status == AnimationStatus.completed ||
//                         _rotationController.status == AnimationStatus.forward) {
//                       _rotationController.reverse();
//                     } else {
//                       _rotationController.forward();
//                     }
//                   }
//                 },
//                 child: RotationTransition(
//                   turns: _rotationAnimation,
//                   child: Image.asset(
//                     'assets/images/ic_scored_one.png',
//                     // Replace with your image asset
//                     width: _imageWidth, // Set the width of the image
//                     height: _imageHeight, // Set the height of the image
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class ImageScaleAnimation extends StatefulWidget {
//   @override
//   _ImageScaleAnimationState createState() => _ImageScaleAnimationState();
// }
//
// class _ImageScaleAnimationState extends State<ImageScaleAnimation> with TickerProviderStateMixin {
//   late AnimationController _scaleController;
//   late Animation<double> _scaleAnimation;
//   double _imageWidth = 100.0; // Initial width of the image
//   double _imageHeight = 100.0; // Initial height of the image
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a scale animation controller
//     _scaleController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of the scale animation
//     );
//
//     // Create a tween animation for the scale effect
//     _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_scaleController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           // Do nothing, animation is completed and will be stable at 1.0 scale
//         } else if (status == AnimationStatus.dismissed) {
//           setState(() {
//             _imageWidth = 100.0; // Reset the image width to the original size
//             _imageHeight = 100.0; // Reset the image height to the original size
//           });
//           _scaleController.forward(); // Forward the scale animation when it dismisses
//         }
//       });
//
//     // Start the scale animation
//     _scaleController.forward();
//   }
//
//   @override
//   void dispose() {
//     _scaleController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _scaleAnimation,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: _scaleAnimation.value,
//               // Get the current scale value from the animation
//               child: GestureDetector(
//                 onTap: () {}, // Empty onTap function to prevent gesture conflicts
//                 child: Image.asset(
//                   'assets/images/ic_scored_one.png',
//                   // Replace with your image asset
//                   width: _imageWidth, // Set the width of the image
//                   height: _imageHeight, // Set the height of the image
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class ImageScaleAnimation extends StatefulWidget {
//   @override
//   _ImageScaleAnimationState createState() => _ImageScaleAnimationState();
// }
//
// class _ImageScaleAnimationState extends State<ImageScaleAnimation> with TickerProviderStateMixin {
//   late AnimationController _scaleController;
//   late Animation<double> _scaleAnimation;
//   late AnimationController _rotationController;
//   late Animation<double> _rotationAnimation;
//   double _imageWidth = 100.0; // Initial width of the image
//   double _imageHeight = 100.0; // Initial height of the image
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a scale animation controller
//     _scaleController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of the scale animation
//     );
//
//     // Create a rotation animation controller
//     _rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1), // Set the duration of the rotation animation
//     );
//
//     // Create a tween animation for the scale effect
//     _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_scaleController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           // Start the rotation animation when scale animation is completed
//           _rotationController.forward();
//         } else if (status == AnimationStatus.dismissed) {
//           setState(() {
//             _imageWidth = 100.0; // Reset the image width to the original size
//             _imageHeight = 100.0; // Reset the image height to the original size
//           });
//           _scaleController.forward(); // Forward the scale animation when it dismisses
//         }
//       });
//
//     // Create a tween animation for the rotation effect
//     _rotationAnimation = Tween<double>(begin: -0.25, end: 0.25).animate(_rotationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _rotationController.reverse(); // Reverse the rotation animation when it completes
//         } else if (status == AnimationStatus.dismissed) {
//           _rotationController.forward(); // Forward the rotation animation when it dismisses
//         }
//       });
//
//     // Start the scale animation
//     _scaleController.forward();
//   }
//
//   @override
//   void dispose() {
//     _scaleController.dispose();
//     _rotationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _scaleAnimation,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: _scaleAnimation.value,
//               // Get the current scale value from the animation
//               child: RotationTransition(
//                 turns: _rotationAnimation,
//                 // Get the current rotation value from the animation
//                 child: GestureDetector(
//                   onTap: () {}, // Empty onTap function to prevent gesture conflicts
//                   child: Image.asset(
//                     'assets/images/ic_scored_one.png',
//                     // Replace with your image asset
//                     width: _imageWidth, // Set the width of the image
//                     height: _imageHeight, // Set the height of the image
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
//
// class ImageScaleAnimation extends StatefulWidget {
//   @override
//   _ImageScaleAnimationState createState() => _ImageScaleAnimationState();
// }
//
// class _ImageScaleAnimationState extends State<ImageScaleAnimation>
//     with TickerProviderStateMixin {
//   late AnimationController _scaleController;
//   late Animation<double> _scaleAnimation;
//   double _imageWidth = 100.0; // Initial width of the image
//   double _imageHeight = 100.0; // Initial height of the image
//
//   late AnimationController _rotateController;
//   late Animation<double> _rotateAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create a scale animation controller
//     _scaleController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Set the duration of the scale animation
//     );
//
//     // Create a tween animation for the scale effect
//     _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_scaleController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           // Start the rotation animation when the scale animation is completed
//           _rotateController.repeat();
//         } else if (status == AnimationStatus.dismissed) {
//           setState(() {
//             _imageWidth = 100.0; // Reset the image width to the original size
//             _imageHeight = 100.0; // Reset the image height to the original size
//           });
//           _rotateController.stop();
//           _scaleController.forward(); // Forward the scale animation when it dismisses
//         }
//       });
//
//     // Create a rotation animation controller
//     _rotateController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1), // Set the duration of the rotation animation
//     );
//
//     // Create a tween animation for the rotation effect
//     _rotateAnimation = Tween<double>(begin: 0.0, end: math.pi * 2).animate(_rotateController);
//
//     // Start the scale animation
//     _scaleController.forward();
//   }
//
//   @override
//   void dispose() {
//     _scaleController.dispose();
//     _rotateController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _scaleAnimation,
//           builder: (context, child) {
//             return Transform.scale(
//               scale: _scaleAnimation.value,
//               // Get the current scale value from the animation
//               child: AnimatedBuilder(
//                 animation: _rotateAnimation,
//                 builder: (context, child) {
//                   return Transform.rotate(
//                     angle: _rotateAnimation.value,
//                     child: GestureDetector(
//                       onTap: () {}, // Empty onTap function to prevent gesture conflicts
//                       child: Image.asset(
//                         'assets/images/ic_scored_one.png',
//                         // Replace with your image asset
//                         width: _imageWidth, // Set the width of the image
//                         height: _imageHeight, // Set the height of the image
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

//}



import 'dart:math' as math;

import 'package:flutter/material.dart';

class ImageScaleAnimation extends StatefulWidget {
  @override
  _ImageScaleAnimationState createState() => _ImageScaleAnimationState();
}

class _ImageScaleAnimationState extends State<ImageScaleAnimation>
    with TickerProviderStateMixin {
  late AnimationController _scaleController1;
  late Animation<double> _scaleAnimation1;
  double _imageWidth1 = 100.0; // Initial width of the first image
  double _imageHeight1 = 100.0; // Initial height of the first image

  late AnimationController _scaleController2;
  late Animation<double> _scaleAnimation2;
  double _imageWidth2 = 50.0; // Initial width of the second image
  double _imageHeight2 = 50.0; // Initial height of the second image

  @override
  void initState() {
    super.initState();

    // Create a scale animation controller for the first image
    _scaleController1 = AnimationController(
      vsync: this,
      duration: Duration(
          seconds: 2), // Set the duration of the first scale animation
    );

    // Create a tween animation for the first scale effect
    _scaleAnimation1 =
    Tween<double>(begin: 0.0, end: 1.0).animate(_scaleController1)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleController2
              .forward(); // Start the second scale animation when the first scale animation is completed
        } else if (status == AnimationStatus.dismissed) {
          setState(() {
            _imageWidth1 =
            100.0; // Reset the first image width to the original size
            _imageHeight1 =
            100.0; // Reset the first image height to the original size
          });
          _scaleController1
              .forward(); // Forward the first scale animation when it dismisses
        }
      });

    // Create a scale animation controller for the second image
    _scaleController2 = AnimationController(
      vsync: this,
      duration: Duration(
          seconds: 2), // Set the duration of the second scale animation
    );

    // Create a tween animation for the second scale effect
    _scaleAnimation2 =
    Tween<double>(begin: 0.0, end: 1.0).animate(_scaleController2)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleController1
              .forward(); // Start the first scale animation when the second scale animation is completed
        } else if (status == AnimationStatus.dismissed) {
          setState(() {
            _imageWidth2 =
            50.0; // Reset the second image width to the original size
            _imageHeight2 =
            50.0; // Reset the second image height to the original size
          });
          _scaleController2
              .forward(); // Forward the second scale animation when it dismisses
        }
      });

    // Start the first scale animation
    _scaleController1.forward();
  }

  @override
  void dispose() {
    _scaleController1.dispose();
    _scaleController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AnimatedBuilder(
                animation: _scaleAnimation1,
                builder: (context, child) {
                  return Transform.scale(
                      scale: _scaleAnimation1.value,
                      // Get the current scale value from the first animation
                      child: GestureDetector(
                        onTap: () {},
                        // Empty onTap function to prevent gesture conflicts
                        child: Image.asset(
                          'assets/images/ic_scored_one.png',
                          // Replace with your image asset

                        ),
                      ));
                })));
  }
}