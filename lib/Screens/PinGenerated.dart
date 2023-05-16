import 'package:buzzerapp/PopupScreens/InputPlayers.dart';
import 'package:buzzerapp/Screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';

import '../PopupScreens/TimeLimitMaster.dart';
import 'GeneratePinButton.dart';


class PINGenerated extends StatefulWidget {
  PINGenerated({super.key});
  @override
  _PINGeneratedState createState() => _PINGeneratedState();
}

class _PINGeneratedState extends State<PINGenerated> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: commonBackground,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _appbar(context),
              const SizedBox(
                height: 30,
              ),
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
    backgroundColor: commonBackground,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()));
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
            'PIN Generation',
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

Widget _mainContainer(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: gamePopColor, width: 2),
        borderRadius: BorderRadius.circular(20)),
    child: Expanded(
      child: Container(
        width: 350,
        height: 650,
        child: Column(
          children: <Widget>[
            _firstContainer(context),
            _secondContainer(context),
            _thirdContainer(context),
            const GroupButtonLimit(),
            const SizedBox(
              height: 50,
            ),
            const pinButton()
          ],
        ),
      ),
    ),
  );
}

Widget _firstContainer(BuildContext context) {
  return Column(
    children: [
      Container(
        transform: Matrix4.translationValues(0, 20, 0),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            SizedBox(
              child: Image.asset('assets/images/ic_target.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              child: Text(
                'you are creating the game as a master',
                style: TextStyle(
                    color: textYellow,
                    fontFamily: 'Gilroy',
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget _secondContainer(BuildContext context) {
  return Container(
      child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 42),
            transformAlignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  child: Text(
                    'Number of players',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  child: InputPlayer(),
                )
              ],
            ),
          )));
}

Widget _thirdContainer(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Time Limit',
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            fontSize: 16),
      ),
    ),
  );
}
