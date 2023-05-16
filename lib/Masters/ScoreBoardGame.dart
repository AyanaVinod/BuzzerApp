import 'package:buzzerapp/PopupScreens/ExitGame_Generator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';
import '../ListViews/PlayerListview.dart';

class ScoreBoard extends StatefulWidget {
  ScoreBoard({super.key});
  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: gamePopColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _appbar(context),
              const SizedBox(
                height: 30,
              ),
              _headingContainer(context),
              _exitContainer(context),
              _chancesContainer(context),
              _mainContainer(context),
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

Widget _headingContainer(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: const [
        Text(
          'Timer  :',
          style: (TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white)),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '30 sec',
          style: (TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: textYellow)),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.edit,
          size: 15,
          color: Colors.white,
        )
      ],
    ),
  );
}

Widget _exitContainer(BuildContext context) {
  return Container(
    transform: Matrix4.translationValues(250, -40, 0),
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              child: Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: backArrowLeft),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ExitGenerator()));
                      },
                      child: Image.asset(
                          'assets/images/ic_Sign_out_squre_light.png')),
                ),
              ),
            ),
          ],
        ),
        Container(
            transform: Matrix4.translationValues(-20, 10, 0),
            child: Row(
              children: const [
                Text(
                  'Finish/Exit Play',
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )
              ],
            ))
      ],
    ),
  );
}

Widget _chancesContainer(BuildContext context) {
  return Container(
    transform: Matrix4.translationValues(20, -50, 0),
    child: Row(
      children: const [
        Text(
          'Chances  :',
          style: (TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white)),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '2',
          style: (TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: textYellow)),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.edit,
          size: 15,
          color: Colors.white,
        )
      ],
    ),
  );
}

Widget _mainContainer(BuildContext context) {
  return Container(
    height: 596,
    width: double.infinity,
    decoration: BoxDecoration(
        color:gradient1,
        border: Border.all(color: gamePopColor, width: 0),
        borderRadius: BorderRadius.circular(0)),
    child: Column(
      children: [
        _firstContainer(context),
        _secondContainer(context),
        PlayerListView(),
        _thirdContainer(context),
      ],
    ),
  );
}

Widget _firstContainer(BuildContext context) {
  return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
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
    child: Image.asset(
      'assets/images/ic_pattern_bottom.png',
      fit: BoxFit.fill,
      width: 500,
    ),
  );
}
