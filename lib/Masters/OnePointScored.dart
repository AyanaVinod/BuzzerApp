// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../Colors/colors.dart';
// import 'dart:math' as math;
//
//
// class OnePointScored extends StatefulWidget {
//   OnePointScored({super.key});
//   @override
//   _OnePointScored createState() => _OnePointScored();
// }
//
// class _OnePointScored extends State<OnePointScored>
//     with TickerProviderStateMixin {
//   late AnimationController _scaleController;
//   late Animation<double> _scaleAnimation;
//   double _imageWidth = 140.0; // Initial width of the image
//   double _imageHeight = 140.0; // Initial height of the image
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
//       duration: Duration(seconds: 3), // Set the duration of the scale animation
//     );
//
//     // Create a tween animation for the scale effect
//     _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_scaleController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           // Start the rotation animation when the scale animation is completed
//           _rotateController.repeat(); // Repeat the rotation animation
//         } else if (status == AnimationStatus.dismissed) {
//           setState(() {
//             _imageWidth = 140.0; // Reset the image width to the original size
//             _imageHeight = 140.0; // Reset the image height to the original size
//           });
//           _rotateController.stop();
//           _scaleController.forward(); // Forward the scale animation when it dismisses
//         }
//       });
//
//     // Create a rotation animation controller
//     _rotateController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 3), // Set the duration of the rotation animation
//     );
//
//     // Create a tween sequence animation for the rotation effect
//     _rotateAnimation = TweenSequence([
//       TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: math.pi / 4), weight: 1.0), // Rotate from front to right
//       TweenSequenceItem(tween: Tween<double>(begin: math.pi / 4, end: -math.pi / 4), weight: 1.0), // Rotate from right to left
//       TweenSequenceItem(tween: Tween<double>(begin: -math.pi / 4, end: 0.0), weight: 1.0), // Rotate from left to front
//     ]).animate(_rotateController);
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
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: gamePopColor,
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               _firstContainer(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// Widget _firstContainer(BuildContext context) {
//   return Container(
//       alignment: Alignment.topCenter,
//       // transform: Matrix4.translationValues(0, -200, 0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Image.asset(
//             'assets/images/ic_pattern_top.png',
//             width: 600,
//             fit: BoxFit.fill,
//           ),
//           Container(
//             // transform: Matrix4.translationValues(0, -150, 0),
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Text(
//                       'Congrats!',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontFamily: 'Gilroy',
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 4,
//                         foreground: Paint()
//                           ..style = PaintingStyle.stroke
//                           ..strokeWidth = 2
//                           ..color = textYellow,
//                       ),
//                     ),
//                     const Text(
//                       'Congrats!',
//                       style: TextStyle(
//                         fontSize: 20,
//                         letterSpacing: 4,
//                         fontFamily: 'Gilroy',
//                         fontWeight: FontWeight.w500,
//                         color: gamePopColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Stack(
//                   children: [
//                     Text(
//                       'you got 1 point',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontFamily: 'Gilroy',
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: 2,
//                         foreground: Paint()
//                           ..style = PaintingStyle.stroke
//                           ..strokeWidth = 3
//                           ..color = Colors.white,
//                       ),
//                     ),
//                     const Text(
//                       'you got 1 point',
//                       style: TextStyle(
//                         fontSize: 24,
//                         letterSpacing: 2,
//                         fontFamily: 'Gilroy',
//                         fontWeight: FontWeight.w500,
//                         color: gamePopColor,
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 40,),
//          AnimatedBuilder(
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
//       ]),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';
import 'dart:math' as math;

class OnePointScored extends StatefulWidget {
  OnePointScored({super.key});
  @override
  _OnePointScored createState() => _OnePointScored();
}

class _OnePointScored extends State<OnePointScored>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<double> _animation1;
  late AnimationController _controller2;
  late Animation<double> _animation2;
  late AnimationController _controller3;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _animation1 = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_controller1);

    //_controller1.repeat(reverse: true);

    _controller2 = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation2 = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_controller2);

    _controller3 = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _animation3 = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_controller3);
    // _controller3.repeat(reverse: true);

    _controller2.forward().then((_) {
      _controller1.repeat(reverse: true);
      _controller3.repeat(reverse: true);
    });

    //   _controller1.addListener(() {
    //     if (_controller1.isCompleted) {
    //       _controller1.reverse();
    //     }
    //   });
    //   _controller3.addListener(() {
    //     if (_controller3.isCompleted) {
    //       _controller3.reverse();
    //     }
    //   });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: gamePopColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _firstContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _firstContainer(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        // transform: Matrix4.translationValues(0, -200, 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            'assets/images/ic_pattern_top.png',
            width: 600,
            fit: BoxFit.fill,
          ),
          Container(
            // transform: Matrix4.translationValues(0, -150, 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Text(
                      'Congrats!',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = textYellow,
                      ),
                    ),
                    const Text(
                      'Congrats!',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 4,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: gamePopColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Text(
                      'you got 1 point',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.white,
                      ),
                    ),
                    const Text(
                      'you got 1 point',
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 2,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: gamePopColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          AnimatedBuilder(
            animation: _animation1,
            builder: (BuildContext context, Widget? child) {
              return Transform.scale(
                scale: _animation1.value,
                child: SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: Image.asset(
                    'assets/images/ic_scored_text_upper.png',
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animation2,
            builder: (BuildContext context, Widget? child) {
              return Transform.scale(
                scale: _animation2.value,
                child: SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: Image.asset(
                    'assets/images/ic_scored.png',
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animation3,
            builder: (BuildContext context, Widget? child) {
              return Transform.scale(
                scale: _animation3.value,
                child: SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: Image.asset(
                    'assets/images/ic_scored_text_below.png',
                  ),
                ),
              );
            },
          ),
        ]));
  }
}
