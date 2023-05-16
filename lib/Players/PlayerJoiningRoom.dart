import 'package:buzzerapp/Animations/Masters/PlayerAnimationFirstPosition.dart';
import 'package:buzzerapp/PopupScreens/Verification_Generator.dart';
import 'package:buzzerapp/PopupScreens/Verification_PopUp.dart';
import 'package:buzzerapp/Screens/CurrentSession.dart';
import 'package:buzzerapp/Screens/HomeScreen.dart';

//import 'package:buzzerapp/SocketIO/services/socket_demo.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';
import '../Masters/ScoreBoardGame.dart';
import '../PopupScreens/PinCodeGenerator.dart';
import '../PopupScreens/PopupQRGenerator.dart';
import '../PopupScreens/QRCodeGenerator.dart';
import '../PopupScreens/ExitGame_Generator.dart';
import '../Screens/BuzzerMainScreen.dart';
import '../Screens/ShareOption.dart';
import '../Screens/UserjoinedSmiley.dart';
import 'package:buzzerapp/PopupScreens/GeneratePopup.dart';

class TeamRoom extends StatefulWidget {

  @override
  _TeamRoomState createState() => _TeamRoomState();
}
void _onStartButtonPressed(BuildContext context, bool isMaster) {
  if (isMaster) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScoreBoard()),
    ); // Navigate to MasterScreen
  }
  else
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BuzzerMain()),
    ); // Navigate to PlayerScreen
  };
}

class _TeamRoomState extends State<TeamRoom> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          setState(() {
          //  SocketService.dispose();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          });
          return true;
        },
        child: MaterialApp(
          home: Scaffold(
            backgroundColor: gamePopColor,
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  _appbar(context),
                  const SizedBox(
                    height: 30,
                  ),
                  _headingContainer(context),
                  const SizedBox(
                    height: 30,
                  ),
                  _mainContainer(context),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget _appbar(BuildContext context) {
  return AppBar(
    backgroundColor: gamePopColor,
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
                  //SocketService.dispose();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
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
            'Team Room',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}

Widget _headingContainer(BuildContext context) {

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        Text(
          'Timer  :',
          style: (TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white)),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '30 sec',
          style: (TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: textYellow)),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.edit,
          size: 15,
          color: Colors.white,
        ),

      Padding(padding: EdgeInsets.only(bottom: 0, left: 0, right: 60, top: 0),
      ),

      SizedBox(width: 30,),
     Align(alignment: Alignment.topRight,

  child: ElevatedButton(
  onPressed: () {
    Navigator.push(context,
       // MaterialPageRoute(builder: (context) => const QRCodePopUp()));
        MaterialPageRoute(builder: (context) =>  PINCodePopUp()));
  },
    child: Text('Show QR/PIN', style: (TextStyle(
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.black)),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  ),
     )
        ],
    ),
  );
}

Widget _mainContainer(BuildContext context) {
  //SocketService.init();
  // return StreamBuilder(
  //   //stream: SocketService.messageStream,
  //   builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
  //     if (snapshot.connectionState == ConnectionState.none) {
  //       return const Center(child: LinearProgressIndicator());
  //     }
  //
  //     if (snapshot.data == null) {
  //       return const SizedBox();
  //     }
  //
  //     return SingleChildScrollView(
  //       scrollDirection: Axis.horizontal,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: (snapshot.data ?? [])
  //             .map((e) => Container(
  //                   decoration: BoxDecoration(
  //                       color: commonBackground,
  //                       border: Border.all(color: gamePopColor, width: 2),
  //                       borderRadius: BorderRadius.circular(20)),
                    return Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 40),
                        width: 350,
                        height: 600,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: DottedBorder(
                                      borderType: BorderType.Circle,
                                      radius: const Radius.circular(20),
                                      dashPattern: const [10, 10],
                                      color:
                                          joineduser ? textYellow : greyColor,
                                      strokeWidth: 1,
                                      child: Card(
                                        color: smileyBackground,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Center(
                                            child: Icon(
                                          CupertinoIcons.smiley,
                                          size: 50,
                                          color: joineduser
                                              ? textYellow
                                              : greyColor,
                                        )),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 70,
                                ),
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: DottedBorder(
                                      borderType: BorderType.Circle,
                                      radius: const Radius.circular(20),
                                      dashPattern: const [10, 10],
                                      color: greyColor,
                                      strokeWidth: 1,
                                      child: Card(
                                        color: smileyBackground,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: const Center(
                                            child: Icon(
                                          CupertinoIcons.smiley,
                                          size: 50,
                                          color: greyColor,
                                        )),
                                      ),
                                    )),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 37),
                              child: Row(
                                children: [
                                  Text(
                                    'Player',
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 16,
                                        color:
                                            joineduser ? textYellow : greyColor,
                                        fontWeight: FontWeight.w500),
                                  ),

                                  const SizedBox(
                                    width: 140,
                                  ),
                                  // const Text(
                                  //   'Player',
                                  //   style: TextStyle(
                                  //       fontFamily: 'Gilroy',
                                  //       fontSize: 16,
                                  //       color: greyColor,
                                  //       fontWeight: FontWeight.w500),
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: DottedBorder(
                                        borderType: BorderType.Circle,
                                        radius: const Radius.circular(20),
                                        dashPattern: [10, 10],
                                        color: greyColor,
                                        strokeWidth: 1,
                                        child: Card(
                                          color: smileyBackground,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Center(
                                              child: Icon(
                                            CupertinoIcons.smiley,
                                            size: 50,
                                            color: greyColor,
                                          )),
                                        ),
                                      )),
                                  // SizedBox(width: 70,),
                                  SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: DottedBorder(
                                        borderType: BorderType.Circle,
                                        radius: const Radius.circular(20),
                                        dashPattern: const [10, 10],
                                        color: greyColor,
                                        strokeWidth: 1,
                                        child: Card(
                                          color: smileyBackground,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Center(
                                              child: Icon(
                                            CupertinoIcons.smiley,
                                            size: 50,
                                            color: greyColor,
                                          )),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            //   child: Row(
                            //     children: const [
                            //       Text(
                            //         'Player',
                            //         style: TextStyle(
                            //             fontFamily: 'Gilroy',
                            //             fontSize: 16,
                            //             color: greyColor,
                            //             fontWeight: FontWeight.w500),
                            //       ),
                            //       SizedBox(
                            //         width: 150,
                            //       ),
                            //       Text(
                            //         'Player',
                            //         style: TextStyle(
                            //             fontFamily: 'Gilroy',
                            //             fontSize: 16,
                            //             color: greyColor,
                            //             fontWeight: FontWeight.w500),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            const SizedBox(
                              height: 100,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: Row(
                                children: const [
                                  Text(
                                    'waiting for others to join...',
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        color: textYellow,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                  autofocus: masterVisibility = true,
                                onPressed: () {
                                 // _onStartButtonPressed(context, masterVisibility);
                                 //  Navigator.push(
                                 //      context,
                                 //      MaterialPageRoute(
                                 //          builder: (context) =>
                                 //              BuzzerMain()));
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: const BorderSide(
                                          width: 3, color: Colors.white),
                                    ))),
                                child: const Text(
                                  'Start',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
}
