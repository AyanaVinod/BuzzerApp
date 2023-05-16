import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';
import '../ListViews/PlayerListview.dart';
import '../ListViews/PlayerScoreList.dart';

class PlayerScoreBoard extends StatefulWidget {
  PlayerScoreBoard({super.key});
  @override
  _PlayerScoreBoardState createState() => _PlayerScoreBoardState();
}

class _PlayerScoreBoardState extends State<PlayerScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:gradient1,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _appbar(context),
              const SizedBox(
                height: 30,
              ),
              _firstContainer(context),
              _secondContainer(context),
              PlayerScoreList(),
              _thirdContainer(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _appbar(BuildContext context) {
  return AppBar(
    backgroundColor: gamePopColor,
    title: Row(
      children: <Widget>[
        SizedBox(
          child: Material(
            type: MaterialType.transparency,
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: backArrowLeft),
              child: InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ()));
                },
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        const SizedBox(
          child: Text(
            'Scoreboard',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}
Widget _firstContainer(BuildContext context) {
  return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: const Text(
          'Point Table',
          style: TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              fontSize: 16,backgroundColor: gradient1,
              color: textYellow),

        ),
      ));
}

Widget _secondContainer(BuildContext context) {
  return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: textYellow),
        ),
      ));
}
Widget _thirdContainer(BuildContext context) {
  return Expanded(
      flex: 1,
      child: Align
        (
          alignment: Alignment.bottomLeft,
          child: Stack(
              children: [
                Image.asset('assets/images/ic_pattern_bottom.png',
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  fit: BoxFit.fill,),
              ])));
}

