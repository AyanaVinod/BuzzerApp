import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';

class InputPlayer extends StatefulWidget {
  const InputPlayer({super.key});
  @override
  _InputPlayerState createState() => _InputPlayerState();
}

class _InputPlayerState extends State<InputPlayer> {
  int simpleIntInput = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Material(
            type: MaterialType.transparency,
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: popupBackground1),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (simpleIntInput < 1) {
                      return;
                    }
                    simpleIntInput--;
                  });
                },
                child: const Icon(
                  CupertinoIcons.minus,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 45,
            height: 35,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: gamePopColor),
            child: Text(
              '$simpleIntInput',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Material(
            type: MaterialType.transparency,
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: popupBackground1),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    simpleIntInput++;
                  });
                },
                child: const Icon(
                  CupertinoIcons.plus,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
