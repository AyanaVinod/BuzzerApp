import 'package:buzzerapp/Colors/colors.dart';
import 'package:buzzerapp/PopupScreens/GeneratePopup.dart';
import 'package:buzzerapp/models/Players.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';

import '../Colors/colors.dart';
import '../Screens/CurrentSession.dart';

class PlayerListViewAnimation extends StatefulWidget {
  PlayerListViewAnimation({super.key});
  @override
  _PlayerListViewAnimation createState() => _PlayerListViewAnimation();
}

class _PlayerListViewAnimation extends State<PlayerListViewAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            transform: Matrix4.translationValues(30, 0, 0),
            width: 320,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            //   child: ListView(
            //       scrollDirection: Axis.vertical,
            //       children: [
            //     ListTile(
            //         onTap: () {},
            //         title: Text(
            //           currentuser,
            //           style: (const TextStyle(
            //               fontFamily: 'Gilroy',
            //               color: Colors.white,
            //               fontSize: 18,
            //               fontWeight: FontWeight.w500)),
            //         ),
            //         leading: Stack(children: [
            //           Image.asset('assets/images/ic_firstposition_icon.png'),
            //           Container(
            //               transform: Matrix4.translationValues(15, 14, 0),
            //               child: Image.asset('assets/images/ic_one.png'))
            //         ])),
            //     ListTile(
            //       title: Text(
            //         currentuser,
            //         style: (const TextStyle(
            //             fontFamily: 'Gilroy',
            //             color: Colors.white,
            //             fontSize: 18,
            //             fontWeight: FontWeight.w500)),
            //       ),
            //       leading: Image.asset('assets/images/ic_second_scored.png'),
            //     ),
            //     ListTile(
            //         title: Text(
            //           currentuser,
            //           style: (const TextStyle(
            //               fontFamily: 'Gilroy',
            //               color: Colors.white,
            //               fontSize: 18,
            //               fontWeight: FontWeight.w500)),
            //         ),
            //         leading: Stack(children: [
            //           Image.asset('assets/images/ic_rectangle_three.png'),
            //           Container(
            //               transform: Matrix4.translationValues(15, 14, 0),
            //               child: Image.asset('assets/images/ic_three.png'))
            //         ])),
            //   ]),
            // ));
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Expanded(child:
                Container(
                  decoration: BoxDecoration(
                    color: textYellow,
                  ),
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      currentuser,
                      style: (const TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                    ),
                    leading: Stack(children: [
                      Image.asset('assets/images/ic_firstposition_icon.png'),
                      Container(
                          transform: Matrix4.translationValues(15, 14, 0),
                          child: Image.asset('assets/images/ic_one.png'))
                    ]),
                  ),
                ),
                ),
                ListTile(
                  title: Text(
                    currentuser,
                    style: (const TextStyle(
                        fontFamily: 'Gilroy',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                  ),
                  leading: Image.asset('assets/images/ic_second_scored.png'),
                ),
                ListTile(
                  title: Text(
                    currentuser,
                    style: (const TextStyle(
                        fontFamily: 'Gilroy',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                  ),
                  leading: Stack(children: [
                    Image.asset('assets/images/ic_rectangle_three.png'),
                    Container(
                        transform: Matrix4.translationValues(15, 14, 0),
                        child: Image.asset('assets/images/ic_three.png'))
                  ]
                  ),
                ),
              ],
            )
        )
    );
  }
}
