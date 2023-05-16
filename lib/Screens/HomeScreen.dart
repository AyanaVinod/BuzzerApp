import 'dart:async';
import 'dart:async';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:buzzerapp/Masters/FailedAnswerScreen.dart';
import 'package:buzzerapp/PopupScreens/ExitGame_PopUp.dart';
import 'package:buzzerapp/PopupScreens/Verification_PopUp.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:buzzer_demo/PinCodeScreen.dart';
// import 'package:buzzer_demo/QRScannerScreen.dart';
import 'package:buzzerapp/Screens/PinCodeScreen.dart';
import 'package:buzzerapp/Screens/ShareOption.dart';
import 'package:buzzerapp/Screens/WinnerScreen.dart';
import 'package:buzzerapp/Screens/sharing.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kronos/flutter_kronos.dart';
import 'package:intl/intl.dart';
import 'package:buzzerapp/Players/PlayerJoiningRoom.dart';
import 'package:ntp/ntp.dart';

import '../Animations/Masters/PlayerAnimationHoldOn.dart';
import '../Colors/colors.dart';
import '../Masters/MasterJoiningRoom.dart';
import '../Masters/OnePointScored.dart';
import '../Masters/PlayerScoreChances.dart';
import '../Masters/Player_score_check.dart';
import '../Masters/ScoreBoardGame.dart';
import '../PopupScreens/ExitGame_Generator.dart';
import '../PopupScreens/GeneratePopup.dart';
import '../PopupScreens/PopupQRGenerator.dart';
import '../PopupScreens/QRCodeGenerator.dart';
import '../PopupScreens/Verification_Generator.dart';
import 'CurrentSession.dart';

import 'BuzzerMainScreen.dart';

import 'package:timer_builder/timer_builder.dart';

import 'QRCode_Share_Option.dart';
import 'QRScannerScreen.dart';
import 'TimerForMain.dart';
import '';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int? _currentTimeMs;
int? _currentNtpTimeMs;

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    setState(() {
      initPlatformState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.6],
              colors: [
                gradient3,
                gradient4,
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(20, 0.0, 0.0),
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 45,
                      width: 120,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.access_time_outlined,
                          size: 27,
                          color: textYellow,
                        ),
                        label: Timer(context),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(borderColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: const BorderSide(
                                  width: 3, color: borderColor),
                            ))),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30)),
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: DottedBorder(
                          borderType: BorderType.Oval,
                          radius: const Radius.circular(12),
                          color: textYellow,
                          strokeWidth: 1,
                          child: const Icon(
                            CupertinoIcons.profile_circled,
                            size: 50,
                            color: textYellow,
                          ),
                        ),
                        label: TextFormField(
                          onChanged: (value) {
                            currentuser = value;
                            FocusManager.instance.primaryFocus?.unfocus();
                            FocusScope.of(context).unfocus();
                          },
                          initialValue: currentuser,
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy'),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(borderColor),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  bottomLeft: Radius.circular(50.0)),
                              side: BorderSide(width: 3, color: borderColor),
                            ))),
                      ),
                    )
                  ],
                ),
              ),
              _secondContainer(context),
              const SizedBox(height: 100),
              _thirdContainer(context),
              const SizedBox(height: 80),
              _fourthContainer(context),
              const SizedBox(height: 21),
              _fifthContainer(context)
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> initPlatformState() async {
  // Platform messages may fail, so we use a try/catch PlatformException.
  FlutterKronos.sync();
  try {
    _currentTimeMs = await FlutterKronos.getCurrentTimeMs;
    _currentNtpTimeMs = await FlutterKronos.getCurrentNtpTimeMs;
    currentNtpTimeMs = _currentNtpTimeMs;
    var localtime = _currentNtpTimeMs.toString();
    //var datet = localtime
  } on PlatformException {}

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
  // if (!mounted) return;
  //
  // setState(() {});
}

_refreshTime() async {
  final result = await Future.wait([
    FlutterKronos.getCurrentTimeMs,
    FlutterKronos.getCurrentNtpTimeMs,
  ]);
  _currentTimeMs = result[0];
  _currentNtpTimeMs = result[1];
  // setState(() {});
}

extension TimeConvert on int? {
  String get stringify => this == null || this! <= 0
      ? ''
      : DateTime.fromMillisecondsSinceEpoch(this!).toString();
}

String SystemTime() {
  var now = DateTime.now();
  // var time = main();
  initPlatformState();
  if (_currentNtpTimeMs.stringify == "") {
    return "";
  } else {
    var clocktime = DateTime.parse(_currentNtpTimeMs.stringify);

    String formattedTime =
        "${(clocktime.hour > 12 ? clocktime.hour - 12 : clocktime.hour).abs()}:${clocktime.minute < 10 ? '0' : ''}${clocktime.minute} ${clocktime.hour >= 12 ? "PM" : "AM"}";
    return formattedTime;
  }
}
//
// Future<DateTime> main() async {
//   DateTime _myTime;
//   DateTime _ntpTime;
//
//   /// Or you could get NTP current (It will call DateTime.now() and add NTP offset to it)
//   _myTime = await NTP.now();
//
//   /// Or get NTP offset (in milliseconds) and add it yourself
//   // final int offset = await NTP.getNtpOffset(localTime: DateTime.now());
//   // _ntpTime = _myTime.add(Duration(milliseconds: offset));
//   // final int offset = await NTP.getNtpOffset(
//   //     localTime: DateTime.now(), lookUpAddress: "time.google.com");
//   var inputFormat = DateFormat('HH:mm');
//   DateTime internetTime = inputFormat.parse('22:59');
//   return internetTime;
// }

@override
Widget Timer(BuildContext context) {
  return TimerBuilder.periodic(const Duration(seconds: 1), builder: (context) {
    //print("${getSystemTime()}");
    return Text(
      SystemTime(),
      style: const TextStyle(
          color: textYellow,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Gilroy'),
    );
  });
}

Widget _secondContainer(BuildContext context) {
  return Container(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: <Widget>[
        SizedBox(
          child: Material(
            type: MaterialType.transparency,
            child: Ink(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: iconBorder,
              ),
              child: InkWell(
                onTap: () {},
                child: IconButton(
                  icon: const Icon(Icons.volume_up),
                  iconSize: 25,
                  color: Colors.white,
                  onPressed: () {
                    PlayAudio();
                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        SizedBox(
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: popupBackground1,
            ),
            child: const AudioDropdown(),
          ),
        ),
      ],
    ),
  );
}

class AudioDropdown extends StatefulWidget {
  const AudioDropdown({super.key});

  @override
  State<AudioDropdown> createState() => _AudioDropdownState();
}

const List<String> list = <String>[
  'Default sound',
  'Sound1',
  'Sound2',
  'Sound3',
  'Sound4'
];

class _AudioDropdownState extends State<AudioDropdown> {
  String dropdownValue = list.first;
  String audio = 'Default sound';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedaudio == 'default' ? list.first : selectedaudio,
      icon: const SizedBox.shrink(),
      elevation: 0,
      style: const TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontFamily: 'Gilroy',
          fontSize: 14,
          fontWeight: FontWeight.w500
          // decorationStyle: TextDecorationStyle.solid
          ),
      underline: const SizedBox.shrink(),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          audio = dropdownValue.toString();
          //selectedaudio = dropdownValue.toString();
          if (dropdownValue == 'Default sound') {
            selectedaudio = 'default';
            PlayAudio();
          } else {
            selectedaudio = dropdownValue.toString();
            PlayAudio();
          }
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        if (value == audio) {
          return DropdownMenuItem<String>(
              value: value,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 120,
                  color: gradient3,
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.music_note,
                        color: Colors.white,
                        size: 18,
                      ),
                      Text(value,
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ));
        } else {
          return DropdownMenuItem(
              value: value,
              child: Container(
                color: Colors.transparent,
                height: 20.0,
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 18,
                    ),
                    Text(value,
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            fontSize: 14)),
                  ],
                ),
              ));
        }
      }).toList(),
    );
  }
}

void CurrentTime() async {
  DateTime startDate = await NTP.now();
  currenttime = startDate.toString();
  // DateTime startDate = new DateTime.now().toLocal();
  int offset = await NTP.getNtpOffset(localTime: startDate);
  //var time = (({startDate.add(Duration(minutes: offset))}).toString());
  //print('NTP DateTime offset align: ${startDate.add(new Duration(milliseconds: offset))}');
//return (({startDate.add(Duration(minutes: offset))}).toString());
}

void PlayAudio() {
  AssetsAudioPlayer.newPlayer().open(
    Audio("assets/audio/$selectedaudio.mp3"),
  );
}

Widget _thirdContainer(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: Column(
      children: <Widget>[
        SizedBox(
          width: 280,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => gamepopup(context));
            },
            icon: const Text(
              'Create a game',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Gilroy',
                  color: textYellow,
                  fontWeight: FontWeight.w500),
            ),
            label: const Icon(CupertinoIcons.plus, size: 40, color: textYellow),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(borderHomeBackground),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: const BorderSide(width: 3, color: borderHomeColor),
                ))),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: 240,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              var userId;
              var currentTime;
              Navigator.push(
                  // context, MaterialPageRoute(builder: (context) => PinCode()));
                  // context, MaterialPageRoute(builder: (context) => QRCodePopUp ()));
                  // context, MaterialPageRoute(builder: (context) =>  WinnerScreenPage()));
                  //context, MaterialPageRoute(builder: (context) => ExitGenerator()));
                 //context, MaterialPageRoute(builder: (context) => ScoreBoard()));
              //context, MaterialPageRoute(builder: (context) => VerifyGenerator()));
              //context, MaterialPageRoute(builder: (context) => QRCodeScreen(userId: '$userId',currentTime:'$currentTime')));
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
            icon: const Text(
              'Join with PIN',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Gilroy',
                  color: textYellow,
                  fontWeight: FontWeight.w500),
            ),
            label: const Icon(Icons.pin_outlined, size: 40, color: textYellow),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(borderHomeBackground),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: const BorderSide(width: 3, color: borderHomeColor),
                ))),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const QRScanner()));
            },
            icon: const Text(
              'Scan QR',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Gilroy',
                  color: textYellow,
                  fontWeight: FontWeight.w500),
            ),
            label: const Icon(CupertinoIcons.qrcode_viewfinder,
                size: 40, color: textYellow),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(borderHomeBackground),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: const BorderSide(width: 3, color: borderHomeColor),
                ))),
          ),
        ),
      ],
    ),
  );
}
Widget _fourthContainer(BuildContext context) {
  return Container(
      child: SizedBox(
    width: 350,
    height: 80,
    child: Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.6],
            colors: [
              gradient5,
              gradient6,
            ],
          ),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: borderHomeColor, width: 3)),
      child: ElevatedButton(
        onPressed: () {
          masterVisibility = false;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BuzzerMain()));
          //MaterialPageRoute(builder: (context) => const BuzzerMain()));
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              'assets/images/ic_FlyingSaucericon.png',
              fit: BoxFit.contain,
            ),
            const Text(
              'Tap here to play buzzor randomly',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Gilroy',
                  color: textYellow,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ),
  ));
}
Widget _fifthContainer(BuildContext context) {
  return Expanded(
    flex: 1,
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset('assets/images/ic_boxpattern.png',
            width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
      ],
    ),
  );
}
