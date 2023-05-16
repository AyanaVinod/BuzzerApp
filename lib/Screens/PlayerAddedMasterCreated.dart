import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';


class PlayerAddedScreen extends StatefulWidget {
  const PlayerAddedScreen({super.key});
  @override
  _PlayerAddedScreen createState() => _PlayerAddedScreen();
}

class _PlayerAddedScreen extends State<PlayerAddedScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: commonBackground,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _appbar(context),
              const SizedBox(
                height: 60,
              ),

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
                  Navigator.pop(context);
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
            '',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontFamily: 'Gilroy',fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}
