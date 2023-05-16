import 'dart:math';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

import '../Colors/colors.dart';
import '../Screens/CurrentSession.dart';
import '../Screens/PinCodeScreen.dart';
import '../Screens/PinGenerated.dart';

class PopupPIN extends StatefulWidget {
  const PopupPIN({super.key});

  @override
  _PopupPINState createState() => _PopupPINState();
}

class _PopupPINState extends State<PopupPIN>
  with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gamePopColor,
      body: Center(
        child: Column(
          children: [
            Container(
              transform: Matrix4.translationValues(260, 15, 0),
              child: Row(
                children: [
                  Material(
                    type: MaterialType.transparency,
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(color: borderHomeColor, width: 1.0),
                        color: popupBackground1,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PinCode()));
                          });
                        },
                        //This keeps the splash effect within the circle
                        borderRadius: BorderRadius.circular(
                            1000.0), //Something large to ensure a circle
                        child: const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(
                            CupertinoIcons.multiply,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 110,
              transform: Matrix4.translationValues(0, 100, 0),
              child: TextFormField(

                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 3),
                      //  when the TextFormField in unfocused
                    ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,width: 3),
                    //  when the TextFormField in unfocused
                  ),
                ),
                onChanged: (value) {
                  value = pinNumber;
                },
                initialValue: pinNumber,
                style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    fontSize: 38,
                    color: Colors.white,letterSpacing:3,),
                readOnly: true,
              ),
            ),
            SizedBox(height: 120,),
            const Text(
              'share this QR with others to join',
              style: TextStyle(
                  color: textYellow,
                  fontFamily: 'Gilroy',
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height:5),
            ElevatedButton.icon(
              icon: const Text('Share'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Background color
                onPrimary: Colors.black, // Text color
                elevation: 2,
                textStyle: const TextStyle(fontSize:14,fontFamily:'Gilroy'),
                minimumSize: const Size(150, 30), // Button elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Button border radius
                ),
              ),
              label: Icon(Icons.share, size: 15),
              onPressed: () => {
                Share.share('Your current pin number is:' '$pinNumber',),
              },
            ),
          ],
        ),
      ),
    );
  }
}
