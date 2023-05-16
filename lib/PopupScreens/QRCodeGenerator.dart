import 'package:buzzerapp/Colors/colors.dart';
import 'package:buzzerapp/PopupScreens/PopupQRGenerator.dart';
import 'package:buzzerapp/PopupScreens/TabSwitcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class QRCodePopUp extends StatefulWidget {
  const QRCodePopUp({super.key});
  @override
  _QRCodePopUpState createState() => _QRCodePopUpState();
}

class _QRCodePopUpState extends State<QRCodePopUp>
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
        child:const PopupQR(),
      ),
    );
  }
}
