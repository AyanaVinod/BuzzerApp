import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';
import '../PopupScreens/PinCodeGenerator.dart';
import 'CurrentSession.dart';


class pinButton extends StatefulWidget {
  const pinButton({super.key});
  @override
  _pinButtonState createState() => _pinButtonState();
}

class _pinButtonState extends State<pinButton>
    with SingleTickerProviderStateMixin {
  late int randomNumber;
  Random random = Random();
  Random random2 = Random.secure();

  // void generatePinNumber() {
  //   setState(() {
  //     pinNumber = (random.nextInt(88888) + 10000) as String;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            
            randomNumber = (random.nextInt(88888) + 10000);
            pinNumber =randomNumber.toString();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PINCodePopUp()));
          });
          // // pinNumber = (random.nextInt(88888) + 10000) as String;
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const PINCodePopUp( )));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(width: 3, color: Colors.white),
            ))),
        child: const Text(
          'Generate PIN',
          style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
