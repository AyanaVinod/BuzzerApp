import 'package:buzzerapp/Screens/CurrentSession.dart';
import 'package:buzzerapp/Screens/JoinedUserSession.dart';
import 'package:buzzerapp/SocketIO/services/socket_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';


class PlayerAddedRoom extends StatefulWidget {
  PlayerAddedRoom({super.key});
  @override
  _PlayerAddedRoom createState() => _PlayerAddedRoom();
}

class _PlayerAddedRoom extends State<PlayerAddedRoom> {
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
                height: 200,
              ),
              _firstContainer(context),
              const SizedBox(
                height: 30,
              ),
              _secondContainer(context),
              const SizedBox(
                height: 20,
              ),
              _thirdContainer(context),
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
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}

Widget _firstContainer(BuildContext context) {
  return Align(
      alignment: Alignment.center,
      child: Column(
        children: const [
          Text(
            'Yayyy!',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Gilroy'),
          ),
          Text('You are added to the game',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Gilroy'))
        ],
      ));
}

Widget _secondContainer(BuildContext context) {
  return Image.asset('assets/images/ic_CircleWavyCheck.png');
}

Widget _thirdContainer(BuildContext context) {

  return SizedBox(
  child:
  //   child: StreamBuilder(
  //     // stream: SocketService.userResponse,
  //     stream: SocketDemo.message(currentuser),
  //     builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.none) {
  //         return const Center(child: LinearProgressIndicator());
  //       }
  //
  //       if (snapshot.data == null) {
  //         return const SizedBox();
  //       }
  //
  //       return SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: (snapshot.data ?? [])
  //               .map((e) => Container(
  //             margin: const EdgeInsets.only(right: 6),
  //             child: Chip(
  //                 avatar: const Icon(Icons.person),
  //                 elevation: 2,
  //                 label: Text(e)),
  //           ))
  //               .toList(),
  //         ),
  //       );
  //     },
  //   ),
  // );
  //
   Text(
    'Joined in as $currentuser',
    style: const TextStyle(
        fontSize: 12,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500,
        color: textYellow),
  )
  );
}
