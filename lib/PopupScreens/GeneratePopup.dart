import 'package:buzzerapp/Colors/colors.dart';
import 'package:buzzerapp/PopupScreens/TabSwitcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class gamepopup extends StatefulWidget {
  const gamepopup(BuildContext context, {super.key});
  @override
  _gamepopupState createState() => _gamepopupState();
}

class _gamepopupState extends State<gamepopup>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      clipBehavior: Clip.antiAlias,

      insetPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width - 10,
        child: StackPop(context),
      ),
    );
  }
}
