import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class SecondPositionPlayer extends StatefulWidget {
  SecondPositionPlayer({super.key});
  @override
  _SecondPositionPlayer createState() => _SecondPositionPlayer();
}

class _SecondPositionPlayer extends State<SecondPositionPlayer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: gamePopColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _firstContainer(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _firstContainer(BuildContext context) {
  return Container(
      alignment: Alignment.topCenter,
      // transform: Matrix4.translationValues(0, -200, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/ic_pattern_top.png',
            width: 600,
            fit: BoxFit.fill,
          ),
          Container(
            child: const Text(
              'hey, don’t worry you might get a chance!',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Column(children: [
            Stack(
              children: [
                Text(
                  'Hold On!',
                  style: TextStyle(
                    fontSize: 53,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 6,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = textYellow,
                  ),
                ),
                const Text(
                  'Hold On!',
                  style: TextStyle(
                    fontSize: 53,
                    letterSpacing: 6,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    color: gamePopColor,
                  ),
                ),
              ],
            ),
          ])
          )
        ],
      ));
}
