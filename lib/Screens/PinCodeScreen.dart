import 'package:buzzerapp/Players/PlayerAddedToRoom.dart';
import 'package:buzzerapp/Screens/CurrentSession.dart';
import 'package:buzzerapp/Screens/HomeScreen.dart';

import 'package:buzzerapp/SocketIO/services/socket_demo.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';
import '../Masters/MasterJoiningRoom.dart';
import '../Players/PlayerJoiningRoom.dart';
import 'PinInputScreen.dart';

class PinCode extends StatefulWidget {
  PinCode({super.key});
  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  @override
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
              _firstContainer(),
              const SizedBox(
                height: 60,
              ),
              _secondContainer(),
              const SizedBox(
                height: 400,
              ),
              _thirdContainer(context),
            ],
          ),
        ),
      ),
    );
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
              'Enter PIN',
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

  Widget _firstContainer() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        'Enter PIN to join',
        style: TextStyle(
            fontSize: 18,
            fontFamily: 'Gilroy',
            color: textYellow,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _secondContainer() {
    return InkWell(
      onTap: () {},
      child: const Align(alignment: Alignment.center, child: PinputExample()),
    );
  }

  Widget _thirdContainer(BuildContext context) {
    var name = currentuser;
    bool _isJoined = false;
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (currentvalue == pinNumber) {
            SocketService.connectAndListen();
            SocketService.setUserName(currentuser);

            setState(() {
              joineduser = true;
            });

            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  TeamRoom()));
          }

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Show Snackbar'),
            duration: Duration(seconds: 3),
          ));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(width: 3, color: Colors.white),
            ))),
        child: const Text(
          'Join',
          style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
