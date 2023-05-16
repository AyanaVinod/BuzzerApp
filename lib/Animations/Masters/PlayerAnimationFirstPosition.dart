
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ListViews/PlayerListviewAnimation.dart';
import '../../Masters/PlayerScoreChances.dart';
import '../../Players/ListViewBorder.dart';
import '../../Players/PlayerScoredPosition.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trial',
      home: Scaffold(body: PlayerAnimation()),
    );
  }
}

class PlayerAnimation extends StatelessWidget {
  const PlayerAnimation({super.key});

  // Wrapper Widget
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return  ListViewBorder();
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
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              padding:
              const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 45),
              margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
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
          Tween(begin: const Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          transformHitTests: true,
          child: child,
        );
      },
    );
  }
}

