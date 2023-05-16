import 'dart:async';
import 'package:buzzerapp/TestCases//testvalidations.dart';
import 'package:buzzerapp/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Colors/colors.dart';


// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
// import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line after backend is deployed
// Generated in previous step
import '../models/ModelProvider.dart';
import 'CurrentSession.dart';
import 'HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trial',
      home: Scaffold(
          body: MyHome()),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  // Wrapper Widget
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return const SplashScreenPage();
  }

  void showAlert(BuildContext context) {
    showGeneralDialog(
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 3000),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              padding:
                  const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 45),
              margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: const SizedBox.expand(
                  child: Scaffold(
                    resizeToAvoidBottomInset: true,
                body: Login(),
                backgroundColor: Colors.transparent,
              )),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
          transformHitTests: true,
        );
      },
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  final _textController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Enter your name',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    autofocus: false,
                    controller: _textController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      errorStyle: (TextStyle(fontSize: 0.01)),
                      filled: true,
                      fillColor: darkBlack,
                      hintStyle: TextStyle(
                          wordSpacing: 1,
                          color: lightGrey,
                          fontFamily: 'Gilroy',
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      hintText: 'enter your name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(width: 3, color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
//button
                SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        if ((_textController.value.text.isNotEmpty)) {
                          currentuser = _textController.value.text;
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()))
                              .then((value) {
                            //This makes sure the text-field is cleared after page is pushed.
                            _textController.clear();
                            FocusScope.of(context).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                            _validate = false;
                          }) as bool;
                        } else if (_textController.value.text.isEmpty) {
                          FocusScope.of(context).unfocus();
                          _validate = true;
                        }
                      });
                    },
                    icon: const Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500),
                    ),
                    label: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 18,
                      color: Colors.black,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: const BorderSide(width: 3, color: Colors.white),
                        ))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
