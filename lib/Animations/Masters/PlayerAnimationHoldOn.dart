import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Colors/colors.dart';
import '../../ListViews/PlayerListviewAnimation.dart';
import '../../Masters/SecondPositionPlayer.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trial',
      home: Scaffold(body: PlayerAnimationHoldOn()),
    );
  }
}

class PlayerAnimationHoldOn extends StatelessWidget {
  const PlayerAnimationHoldOn({super.key});

  // Wrapper Widget
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return  SecondPositionPlayer();
  }

  void showAlert(BuildContext context) {
    showGeneralDialog(
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 2000),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return WillPopScope(
          onWillPop: () async => true,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              padding:
              const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
              margin: const EdgeInsets.only(bottom: 0, left: 25, right: 25,top: 0),
              decoration: const BoxDecoration(
                color:animationcolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child:  SizedBox.expand(
                  child: Scaffold(
                    body:PlayerListViewAnimation(),
                    backgroundColor: Colors.transparent,
                  )),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
          Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
          transformHitTests: true,
        );
      },
    );
  }
}

