import 'dart:ui';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:buzzerapp/Screens/TimerForMain.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kronos/flutter_kronos.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:timer_builder/timer_builder.dart';
import '../Colors/colors.dart';
import '../Players/PlayerJoiningRoom.dart';
import 'CurrentSession.dart';
import 'HomeScreen.dart';

class BuzzerMain extends StatefulWidget {
  const BuzzerMain({super.key});
  @override
  _BuzzerMainState createState() => _BuzzerMainState();
}

late AnimationController _controller;
bool _isPlaying = true;
int? _currentTimeMs;
int? _currentNtpTimeMs = currentNtpTimeMs;
String buzzerTime = '';

class _BuzzerMainState extends State<BuzzerMain>
    with SingleTickerProviderStateMixin {
  Image showImg = Image.asset('assets/images/ic_buzzerRed.png');
  bool isPressed = false;

  void ChangeImage(Image image) {
    setState(() {
      showImg = image;
    });
  }

  // String currenttime = DateFormat('HH:mm:ss:sss a').format(DateTime.now());
  void ChangeTime() {
    // initPlatformState();
    // var now = DateTime.now();
    // currenttime = DateFormat('HH:mm:ss:sss a').format(now);
    var clocktime = DateTime.parse(currentNtpTimeMs.stringify);
    buzzerTime =
        "${clocktime.hour < 10 ? '0' : ''}${(clocktime.hour > 12 ? clocktime.hour - 12 : clocktime.hour).abs()}:${clocktime.minute < 10 ? '0' : ''}${clocktime.minute}:${clocktime.second < 10 ? '0' : ''}${clocktime.second}:${clocktime.millisecond} ${clocktime.hour >= 12 ? "PM" : "AM"}";
  }

  @override
  void initState() {
    super.initState();
    ChangeTime();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.4,
      duration: const Duration(seconds: 6),
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
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

              _firstContainer(context),
              _secondContainer(context),
              //  _seventhContainer(context),

              const SizedBox(
                height: 40,
              ),

              Align(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _buildCircularContainer(230),
                    _buildCircularContainer(330),
                    _buildCircularContainer(380),
                    GestureDetector(
                      onTap: () {
                        if (_isPlaying) {
                          _controller.repeat(max: 1);
                          _controller.forward();
                          _controller.reverse();
                        } else {
                          _controller.forward(from: 0);
                        }
                        ChangeTime();
                        ChangeImage(
                            Image.asset('assets/images/ic_buzzergreen.png'));
                        PlayAudio();
                        Future.delayed(const Duration(seconds: 3), () {
                          ChangeImage(
                              Image.asset('assets/images/ic_buzzerRed.png'));
                        });
                      },
                      child: Align(
                          child: Image(
                        image: showImg.image,
                        width: 250,
                      )),
                    ),
                    const SizedBox(
                      height: 120,
                    )
                  ],
                ),
              ),
              // Padding

              Visibility(
                visible: masterVisibility,
                maintainSize: true, // Set maintainSize to true
                maintainAnimation: true,
                maintainState: true,
                child: _eighthContainer(context),
              ),
              const SizedBox(
                height: 2,
              ),
              Visibility(
                visible: masterVisibility,
                maintainSize: true, // Set maintainSize to true
                maintainAnimation: true,
                maintainState: true,
                child: _ninthContainer(context),
              ),

              const SizedBox(
                height: 35,
              ),
              _fourthContainer(context),
              const SizedBox(
                height: 10,
              ),

              Container(
                width: 350,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundTime,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(
                    color: textYellow,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    buzzerTime,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        color: textYellow,
                        fontSize: 22),
                  ),
                ),
              ),
              //_sixthContainer(context),

              Expanded(
              child: Visibility(
                visible: masterVisibility,
                maintainSize: true, // Set maintainSize to true
                maintainAnimation: true,
                maintainState: true,
                child: _tenthContainer(context),
              ),

              )]),
        ),
      ));

  }
}

Widget _buildCircularContainer(double radius) {
  return AnimatedBuilder(

    animation: CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
      reverseCurve: Curves.bounceOut,
    ),
    builder: (context, child) {

      return Container(
        width: _controller.value * radius,
        height: _controller.value * radius,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(1 - _controller.value),
            shape: BoxShape.circle),
      );
    },
  );
}

Future<void> initPlatformState() async {
  // Platform messages may fail, so we use a try/catch PlatformException.
  FlutterKronos.sync();
  try {
    _currentTimeMs = await FlutterKronos.getCurrentTimeMs;
    _currentNtpTimeMs = await FlutterKronos.getCurrentNtpTimeMs;
    var localtime = _currentNtpTimeMs.toString();
    //buzzerTime = _currentNtpTimeMs.stringify;
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
}

Widget _firstContainer(BuildContext context) {
  return Container(
    transform: Matrix4.translationValues(10, 0.0, 0.0),
    padding: const EdgeInsets.symmetric(vertical: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                backgroundColor: MaterialStateProperty.all(borderColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: const BorderSide(width: 3, color: borderColor),
                ))),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
        SizedBox(
          height: 60,
          width: 180,
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
                backgroundColor: MaterialStateProperty.all(borderColor),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0)),
                  side: BorderSide(width: 3, color: borderColor),
                ))),
          ),
        )
      ],
    ),
  );
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
                  borderRadius: BorderRadius.circular(100), color: iconBorder),
              child: InkWell(
                onTap: () {},
                child: IconButton(
                  icon: const Icon(Icons.volume_up),
                  iconSize: 25,
                  color: Colors.white,
                  onPressed: () {
                    //currenttime = DateTime.now().toString();
                    UpdateText();
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

String BuzzerTime = '';

// Future<DateTime> main() async {
//   DateTime _myTime;
//   DateTime _ntpTime;
//
//   /// Or you could get NTP current (It will call DateTime.now() and add NTP offset to it)
//   _myTime = await NTP.now();
//
//   /// Or get NTP offset (in milliseconds) and add it yourself
//   //final int offset = await NTP.getNtpOffset(localTime: DateTime.now());
//   //_ntpTime = _myTime.add(Duration(milliseconds: offset));
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

void PlayAudio() {
  AssetsAudioPlayer.newPlayer().open(
    Audio("assets/audio/$selectedaudio.mp3"),
  );
}

Widget _eighthContainer(BuildContext context) {
  return const Align(
    alignment: Alignment.bottomCenter,
    child: Text(
      'Your Score',
      style: TextStyle(
          height: 4,
          fontSize: 12,
          fontFamily: 'Gilroy',
          color: Colors.white,
          fontWeight: FontWeight.w500),
    ),
  );
}

Widget _ninthContainer(BuildContext context) {
  return ElevatedButton.icon(
    icon: Image.asset('assets/images/ic_three_white.png',
        color: Colors.white, width: 20, height: 30),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TimerMain()));
    },
    label: Container(
      width: 20, // Specify a fixed width for the Container
      child: Row(
        children: [
          Text(':'),
          Text(' 2'),
        ],
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: gradient4,
      foregroundColor: textYellow,
      elevation: 2, // customize the elevation value
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        // customize the border radius
        side: BorderSide(
          color: gamePopColor,
          width: 1,
        ), // customize the border color and width
      ),
    ),
  );
}

Widget _fourthContainer(BuildContext context) {
  return const Align(
    alignment: Alignment.bottomCenter,
    child: Text(
      'Last Time Stamp',
      style: TextStyle(
          fontSize: 18,
          fontFamily: 'Gilroy',
          color: Colors.white,
          fontWeight: FontWeight.w600),
    ),
  );
}

class UpdateText extends StatefulWidget {
  UpdateTextState createState() => UpdateTextState();
}

class UpdateTextState extends State {
  String textHolder = 'Old Sample Text...!!!';

  changeText() {
    setState(() {
      textHolder = 'New Sample Text...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text('$textHolder',
              style: const TextStyle(
                  fontSize: 21,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500))),
    ])));
  }
}

String BuzzerPressedTime() {
  // initPlatformState();
  var clocktime = DateTime.parse(_currentNtpTimeMs.stringify);
  String currenttime =
      "${(clocktime.hour > 12 ? clocktime.hour - 12 : clocktime.hour).abs()}:${clocktime.minute < 10 ? '0' : ''}${clocktime.minute}:${clocktime.millisecond} ${clocktime.hour >= 12 ? "PM" : "AM"}";
  return currenttime;
}

Widget fifthContainer(BuildContext context) {
  var txt = TextEditingController();
  txt.text = BuzzerTime;
  return SizedBox(
    width: 350,
    child: TextField(
      controller: txt,
      style: const TextStyle(color: textYellow),
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(width: 1, color: textYellow),
        ),
      ),
    ),
  );
}

// Widget _sixthContainer(BuildContext context) {
//   return Container(
//
//         child: Image.asset(
//           'assets/images/ic_QRScanneer.png',
//           height: 300,
//           width: 300,
//         ),
//       );
// }

// Widget _seventhContainer(BuildContext context) {
//   return const Align(
//     alignment: Alignment.bottomCenter,
//     child: Text(
//       'Addantatians',
//       style: TextStyle(height: 3,
//           fontSize: 18,
//           fontFamily: 'Gilroy',
//           color: textYellow,
//           fontWeight: FontWeight.w600),
//     ),
//   );
// }

Widget _tenthContainer(BuildContext context) {
  return Row(children: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.0, vertical:2.0),
      child: Row(children: <Widget>[
        Image.asset('assets/images/ic_usergear.png',
            // Replace with your image path
            width: 30,
            height: 30,
            fit: BoxFit.cover),
        SizedBox(width: 8,height: 2,),
        Text(
          'Addant',
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'Gilroy',
              color: Colors.white,
              fontWeight: FontWeight.w400),
        ),
        Text(
          '(Master)',
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'Gilroy',
              color: textYellow,
              fontWeight: FontWeight.w400),
        ),
      ]),
    ),
    SizedBox(width: 25),
    Align(
        alignment: Alignment.centerRight,
        child: Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(children: [
            Image.asset('assets/images/ic_users_three.png',
                // Replace with your image path
                width: 30,
                height: 30,
                fit: BoxFit.cover),
            Text(
              ' : ',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Gilroy',
                  color: textYellow,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              ' 12 ',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Gilroy',
                  color: textYellow,
                  fontWeight: FontWeight.w400),
            ),
          ]),
        )))
  ]);
}
