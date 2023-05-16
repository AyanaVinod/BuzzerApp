import 'package:buzzerapp/Colors/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WinnerScreenPage extends StatefulWidget {
  const WinnerScreenPage({super.key});
  @override
  _WinnerScreenPage createState() => _WinnerScreenPage();
}

enum AnimationType { scale }

class _WinnerScreenPage extends State<WinnerScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _animationOffset;

  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds:1),
    );
    _animationOffset = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(_controller);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            //padding: EdgeInsets.all(25.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 0.6],
                  colors: [gradient1, gradient2]),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Stack(children: [
                        Lottie.asset(
                          "assets/lottie/confetti-full-screen.json",
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.fill,
                          alignment: Alignment.center,
                          repeat: false,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _animation,
                              builder: (BuildContext context, Widget? child) {
                                return Transform.scale(
                                  scale: _animation.value,
                                  child: child,
                                  alignment: FractionalOffset.center,

                                );

                              },

                              // child: const Text(
                              //   "You won the game",
                              //   style: TextStyle(
                              //       fontSize: 40,
                              //       color: Colors.white,
                              //       fontFamily: 'Gilroy'),
                              // ),

                              child:
                              Stack(

                                children: [

                                  // Bottom Text widget with thicker stroke and different color
                                  Text(
                                    'You won the game',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 30.0,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 1.0
                                        ..color = Colors.white,
                                    ),
                                  ),
                                  // Top Text widget with actual text content
                                  const Text(
                                    'You won the game',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontFamily: 'Gilroy',
                                      color:gradient1 ,
                                    ),
                                  ),
                                ],
                              ),

                          ),
                        ),
                    ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0.0,
                                child: Image.asset(
                                  'assets/images/ic_pattern_bottom.png',
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.bottomLeft,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // child: Lottie.asset("assets/lottie/confetti-full-screen.json",
                        //   height: double.infinity,
                        //   width: double.infinity,
                        //     fit: BoxFit.fill,
                        //     alignment: Alignment.center,
                        // ),
                        //  Expanded(
                        //    flex: 1,
                        //    child:Align(alignment: Alignment.topLeft,
                        // child: Stack(
                        //      children: [
                        //        Positioned(
                        //          bottom: 0.0,
                        //        child: Image.asset('assets/images/ic_pattern_bottom.png',
                        //            width: MediaQuery.of(context).size.width,
                        //            fit: BoxFit.cover,  alignment: Alignment.bottomLeft,),
                        //        ),
                        // Align(
                        //     alignment: Alignment.bottomLeft,
                        //     child:
                        //     Stack(children: const [
                        //
                        //       Image(
                        //         image: AssetImage(
                        //             "assets/images/ic_winners_cup.png"),
                        //         height: 200,
                        //         width: double.infinity,
                        //         fit: BoxFit.contain,
                        //         alignment: Alignment.topCenter,
                        //       ),
                        //     ])),
                         Align(
                            alignment: Alignment.bottomCenter,
                            child:
                               SlideTransition(position: _animationOffset,child: Image.asset('assets/images/ic_winners_cup.png',height: 500,width: 500,),
                               )
                         ),


Align(
  alignment: Alignment.bottomCenter,
            child:Container(
              height: MediaQuery.of(context).size.height/5,
              padding:
              const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 50),
                              child:const Text(
                              'you scored '                           'points ',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Gilroy',
                                fontWeight:FontWeight.normal,
                                color:  textYellow,
                              ),

                            ),

                            ),




)]),
                    ),
                  ),
                ])),
      ),
    );
  }
  void dispose() {
    _controller.stop(); // stop the animation when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
}
