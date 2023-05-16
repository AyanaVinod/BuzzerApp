import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';



class PlayerScoreChances extends StatefulWidget {
  PlayerScoreChances({super.key});
  @override
  _PlayerScoreChances createState() => _PlayerScoreChances();
}

class _PlayerScoreChances extends State<PlayerScoreChances> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:gamePopColor,
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
            transform: Matrix4.translationValues(0, -150, 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Text(
                      'Yaayy!',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.normal,
                        letterSpacing: 6,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = textYellow,
                      ),
                    ),
                    const Text(
                      'Yaayy!',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 6,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.normal,
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
                      'you won a chance',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 6,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.white,
                      ),
                    ),
                    const Text(
                      'you won a chance',
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 6,
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
          Container(
            transform: Matrix4.translationValues(0, -60, 0),
            child: RichText(
              text: const TextSpan(
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(text: 'timer will starts in '),
                    TextSpan(text: '4', style: TextStyle(color: textYellow)),
                    TextSpan(
                        text: ' secs ', style: TextStyle(color: Colors.white)),
                  ]),
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, -40, 0),
            child:
          const Text(
            '30 sec',
            style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 53,
                fontWeight: FontWeight.w600,
                color: textYellow),
          )
          )
        ],
      ));
}
