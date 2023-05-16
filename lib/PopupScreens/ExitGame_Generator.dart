import 'package:buzzerapp/Colors/colors.dart';
import 'package:buzzerapp/PopupScreens/ExitGame_PopUp.dart';
import 'package:buzzerapp/PopupScreens/TabSwitcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ExitGenerator extends StatefulWidget {
  const ExitGenerator({super.key});
  @override
  _ExitGeneratorState createState() => _ExitGeneratorState();
}

class _ExitGeneratorState extends State<ExitGenerator>
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
        child: ExitPopUp(),
      ),
    );
  }
}
