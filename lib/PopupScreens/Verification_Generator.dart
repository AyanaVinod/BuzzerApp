import 'package:buzzerapp/Colors/colors.dart';
import 'package:buzzerapp/PopupScreens/ExitGame_PopUp.dart';
import 'package:buzzerapp/PopupScreens/TabSwitcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Verification_PopUp.dart';



class VerifyGenerator extends StatefulWidget {
  const VerifyGenerator({super.key});
  @override
  _VerifyGeneratorState createState() => _VerifyGeneratorState();
}

class _VerifyGeneratorState extends State<VerifyGenerator>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width - 10,
        child: VerifyPopUp(),
      ),
    );
  }
}
