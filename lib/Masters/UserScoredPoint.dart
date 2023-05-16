import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class UserScoredPoint extends StatefulWidget {
  UserScoredPoint({super.key});
  @override
  _UserScoredPoint createState() => _UserScoredPoint();
}

class _UserScoredPoint extends State<UserScoredPoint> {
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
            transform: Matrix4.translationValues(0, -40, 0),
            child: RichText(
              text: const TextSpan(
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(text: 'Oh!! '),
                    TextSpan(
                        text: 'Addantians',
                        style: TextStyle(color: textYellow)),
                  ]),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            transform: Matrix4.translationValues(0, -40, 0),
            child: RichText(
              text: const TextSpan(
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(text: 'Scored '),
                    TextSpan(text: '1 ', style: TextStyle(color: textYellow)),
                    TextSpan(
                        text: 'point!', style: TextStyle(color: Colors.white)),
                  ]),
            ),
          ),
          Container(
            child: Image.asset('assets/images/ic_SmileySticker.png'),
          ),
          SizedBox(height: 20,),
          Container(
            // transform: Matrix4.translationValues(0, -150, 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Text(
                      'Go hard for your next turn',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = textYellow,
                      ),
                    ),
                    const Text(
                      'Go hard for your next turn',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
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
                      'you will be returned to home in a few secs',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = textYellow,
                      ),
                    ),
                    const Text(
                      'you will be returned to home in a few secs',
                      style: TextStyle(
                        fontSize: 12,
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
        ],
      ));
}
