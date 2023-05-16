
import 'package:buzzerapp/PopupScreens/InputPlayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import '../Colors/colors.dart';
import '../PopupScreens/QRCodeGenerator.dart';
import '../PopupScreens/TimeLimitMaster.dart';
import 'HomeScreen.dart';


class QRGenerated extends StatefulWidget {
  QRGenerated({super.key});
  @override
  _QRGeneratedState createState() => _QRGeneratedState();
}

class _QRGeneratedState extends State<QRGenerated> {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
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
            'QR Generation',
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
            // _fourthContainer(context),
            // _fifthContainer(context),
            // _sixthContainer(context),
            const SizedBox(
              height: 50,
            ),
            _fourthContainer(context)
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

Widget _fourthContainer(BuildContext context) {
  return SizedBox(
    width: 300,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const QRCodePopUp()));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: const BorderSide(width: 3, color: Colors.white),
          ))),
      child: const Text(
        'Generate QR',
        style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
    ),
  );
}
