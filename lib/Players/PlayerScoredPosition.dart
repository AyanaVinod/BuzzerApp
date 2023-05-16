import 'package:buzzerapp/Screens/BuzzerMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Animations/Masters/PlayerAnimationFirstPosition.dart';
import '../Animations/Rooms/PlayerPositionAnimation.dart';
import '../Colors/colors.dart';

class PlayerScoredPosition extends StatefulWidget {
  PlayerScoredPosition({super.key});
  @override
  _PlayerScoredPosition createState() => _PlayerScoredPosition();
}

class _PlayerScoredPosition extends State<PlayerScoredPosition> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: gamePopColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _mainContainer(context),
              _firstContainer(context),
              const SizedBox(height: 80,),
              _secondContainer(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _mainContainer(BuildContext context) {
  return Container(
      alignment: Alignment.topCenter,
      // transform: Matrix4.translationValues(0, -200, 0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Image.asset(
          'assets/images/ic_pattern_top.png',
          width: 600,
          fit: BoxFit.fill,
        ),
      ]));
}

Widget _firstContainer(BuildContext context) {
  return Container(
    transform: Matrix4.translationValues(0, -50, 0),
    width: 350,
    height: 300,
    decoration:  BoxDecoration(
      color: commonBackground,
      borderRadius: BorderRadius.circular(10)),
    child:PlayersListviewTextAnimation()
    );

}

Widget _secondContainer(BuildContext context) {
  return Container(
    width: 300,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BuzzerMain()));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: const BorderSide(width: 3, color: Colors.white),
          ))),
      child: const Text(
        'Back To Buzzer',
        style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
    ),
  );
}
