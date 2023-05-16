import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';

class TimelimitButton extends StatefulWidget {
  const TimelimitButton({super.key});
  @override
  _TimelimitButtonState createState() => _TimelimitButtonState();
}

final Color darkBlue = const Color.fromARGB(255, 18, 32, 47);

class _TimelimitButtonState extends State<TimelimitButton> {
  bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side:
                                const BorderSide(width: 1, color: gamePopColor),
                          ))),
                      child: const Text(
                        '    30 sec    ',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: textYellow,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side:
                                const BorderSide(width: 1, color: gamePopColor),
                          ))),
                      child: const Text(
                        '    45 sec    ',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: textYellow,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          maximumSize: const Size.fromWidth(700),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side:
                                const BorderSide(width: 1, color: gamePopColor),
                          ),
                        ),
                        child: const Text(
                          '     1 min     ',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: textYellow,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: const BorderSide(
                                  width: 1, color: gamePopColor),
                            ))),
                        child: const Text(
                          '     2 min      ',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: textYellow,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 500,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side:
                                const BorderSide(width: 1, color: gamePopColor),
                          ))),
                      child: const Text(
                        '  Custom   ',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: textYellow,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
