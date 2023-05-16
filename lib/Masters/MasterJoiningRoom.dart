import 'package:buzzerapp/Animations/Masters/PlayerAnimationFirstPosition.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';
import '../Screens/BuzzerMainScreen.dart';
import '../Screens/CurrentSession.dart';
import 'FailedAnswerScreen.dart';
import '../ListViews/PlayerListviewAnimation.dart';
import 'OnePointScored.dart';
import 'ScoreBoardGame.dart';
import 'TimerScored.dart';


class TeamRoomMaster extends StatefulWidget {
  TeamRoomMaster({super.key});

  @override
  _TeamRoomMasterState createState() => _TeamRoomMasterState();
}

void _onStartButtonPressed(BuildContext context, bool isMaster) {
  if (isMaster) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScoreBoard())
    ); // Navigate to MasterScreen
  }
  else
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BuzzerMain()),
    ); // Navigate to PlayerScreen
  }
}

class _TeamRoomMasterState extends State<TeamRoomMaster> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ()));
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
      children: const [
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
        )
      ],
    ),
  );
}

Widget _mainContainer(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        color: commonBackground,
        border: Border.all(color: gamePopColor, width: 2),
        borderRadius: BorderRadius.circular(20)),
    child: Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
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
                      color: greyColor,
                      strokeWidth: 1,
                      child: Card(
                        color: smileyBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
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
                      radius: Radius.circular(20),
                      dashPattern: [10, 10],
                      color: greyColor,
                      strokeWidth: 1,
                      child: Card(
                        color: smileyBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
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
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: const [
                  Text(
                    'Team Beta',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: greyColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Text(
                    'Player',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: greyColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            borderRadius: BorderRadius.circular(100),
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
                            borderRadius: BorderRadius.circular(100),
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: const [
                  Text(
                    'Player',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: greyColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Text(
                    'Player',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: greyColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
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
                onPressed: () {
                  _onStartButtonPressed(context,masterVisibility);
                  //masterVisibility = true;
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         //builder: (context) => const PlayerAnimation()));
                  //     //builder: (context) => const BuzzerMain()));
                  //  builder: (context) => ScoreBoard()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(width: 3, color: Colors.white),
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
    ),
  );
}



