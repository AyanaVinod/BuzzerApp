import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class TimerScoredScreen extends StatefulWidget {
  TimerScoredScreen({super.key});
  @override
  _TimerScoredScreen createState() => _TimerScoredScreen();
}

class _TimerScoredScreen extends State<TimerScoredScreen> {
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
              'timer will ends in',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            child: const Text('18 sec',style: TextStyle(fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                fontSize: 53,
                color:textYellow),),
          ),
          SizedBox(height: 40,),
          Container(
            width: 300,
            height: 50,
            child:
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => TimerScoredScreen ()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(rightColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: const BorderSide(width: 2, color: Colors.white),
                  ))),
              child: const Text(
                'Scored',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            width: 300,
            height: 50,
            child:
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => TimerScoredScreen ()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(wrongColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: const BorderSide(width: 2, color: Colors.white),
                  ))),
              child: const Text(
                'Oh no!',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ));
}
