import 'package:buzzerapp/Colors/colors.dart';
import 'package:buzzerapp/models/Players.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../PopupScreens/Verification_Generator.dart';

class PlayerListView extends StatefulWidget {
  PlayerListView({super.key});
  @override
  _PlayerListView createState() => _PlayerListView();
}

class _PlayerListView extends State<PlayerListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: players.length,
          itemBuilder: (context,index){
            return Container(
               padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Text(players[index].name ,style: (const TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w500)),),
                  Container(
                    child: const Text(
                      '0',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                 Container(
                   child:  ElevatedButton(
                     onPressed: () {
            // Navigator.push(context,
            // MaterialPageRoute(builder: (context) => const QRCodePopUp()));
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context) => const VerifyGenerator()));
            },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(rightColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: const BorderSide(width: 1, color: Colors.white),
                  ))),
              child: const Text(
                ' Right ',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
                 ),
                  Container(
                    child:  ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => const QRCodePopUp()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(wrongColor),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: const BorderSide(width: 1, color: Colors.white),
                          ))),
                      child: const Text(
                        'Wrong',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    child:  ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => const QRCodePopUp()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(rightColor),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: const BorderSide(width: 1, color: Colors.white),
                          ))),
                      child: const Text(
                        ' Right ',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }

}